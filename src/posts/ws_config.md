# Websocket config with fastapi and redis

```py
import asyncio
import enum
import json
import logging
from json.decoder import JSONDecodeError
from typing import Dict, List
from uuid import uuid4

import redis
from fastapi import APIRouter, HTTPException, WebSocket, WebSocketDisconnect, status
```

```py
# pub_sub.py
class RedisPubSubManager:
    def connect(self):
        self.redis_connection = redis.Redis(host="localhost", port=6379, decode_responses=True)
        self.pubsub = self.redis_connection.pubsub()

    def disconnect(self):
        self.redis_connection.close()

    def subscribe(self, channel_id):
        self.pubsub.subscribe(channel_id)
        return self.pubsub

    def unsubscribe(self, channel_id):
        self.pubsub.unsubscribe(channel_id)

    def publish(self, channel_id, message: str):
        self.redis_connection.publish(channel_id, message)
```


```py
# ws_manager.py
logger = logging.getLogger(__name__)


class MessageType(enum.Enum):
    NEW_MESSAGE = "NEW_MESSAGE"


class WebSocketManager:
    def __init__(self):
        self.handlers: dict = {}
        self.socket_connections: Dict[int, List[WebSocket]] = {}
        self.pubsub_client = RedisPubSubManager()
        self.channel_id = str(uuid4)

    def start_up(self):
        self.pubsub_client.connect()
        pubsub_subscriber = self.pubsub_client.subscribe(self.channel_id)
        asyncio.create_task(self._pubsub_data_reader(pubsub_subscriber))

    def shut_down(self):
        self.pubsub_client.unsubscribe(self.channel_id)

    def handler(self, message_type):
        def decorator(func):
            self.handlers[message_type] = func
            return func

        return decorator

    async def connect(self, recipient: int, websocket: WebSocket):
        await websocket.accept()

        if recipient not in self.socket_connections:
            self.socket_connections[recipient] = []

        self.socket_connections[recipient].append(websocket)

    def disconnect(self, recipient: int, websocket: WebSocket):
        user_connections = self.socket_connections.get(recipient)
        if not isinstance(user_connections, list):
            return

        if len(user_connections) <= 1:
            # If there is one or zero connection to remove then remove the full object
            del self.socket_connections[recipient]
        else:
            user_connections.remove(websocket)

    async def _broadcast(self, recipients: List[int], message: dict):
        for recipient in recipients:
            connections = self.socket_connections.get(recipient)
            if not connections:
                continue

            for connection in connections:
                try:
                    await connection.send_json(message)
                except Exception as e:
                    logger.error(f"Unable to send message error:{e}")

    async def send_error(self, message: str, websocket: WebSocket):
        await websocket.send_json({"status": "error", "message": message})

    def broadcast_to_chat(self, recipients: List[int], json_message: dict) -> None:
        json_message["recipients"] = recipients

        str_message = json.dumps(json_message)
        self.pubsub_client.publish(self.channel_id, str_message)

    async def _pubsub_data_reader(self, pubsub_subscriber):
        try:
            while True:
                message = pubsub_subscriber.get_message(ignore_subscribe_messages=True)
                if message is not None:
                    data = message["data"]
                    json_message = json.loads(data)
                    recipients = json_message.get("recipients", [])

                    await self._broadcast(recipients, json_message)
        except Exception as exc:
            logger.exception(f"Exception occurred: {exc}")
```


```py
# handlers.py
socket_manager = WebSocketManager()


connection_map = {
    1: [1, 3, 5],
    3: [1, 3, 5],
    5: [1, 3, 5],
    2: [2, 4],
    4: [2, 4],
}


@socket_manager.handler(MessageType.NEW_MESSAGE.value)
def new_message_handler(
    websocket: WebSocket,
    client_id: int,
    data: dict,
    **kwargs,
):
    data["sender"] = {"client_id": client_id}

    client_ids = connection_map.get(client_id, [])
    socket_manager.broadcast_to_chat(client_ids, data)


router = APIRouter()

logger = logging.getLogger(__name__)

clients = {1: "1", 2: "2", 3: "3", 4: "4", 5: "5"}
msg_format = """{ "type": "NEW_MESSAGE", "payload": {"message": "hello"} }"""
```

```py
# routers.py
@router.websocket("/customer/ws/{client_id}")
async def websocket_endpoint(websocket: WebSocket, client_id: int):
    if client_id not in clients:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="Invalid client info")

    await socket_manager.connect(client_id, websocket)
    try:
        while True:
            try:
                data = await websocket.receive_json()

                message_type = data.get("type")
                if not message_type:
                    await socket_manager.send_error("You should provide message type", websocket)
                    continue

                handler = socket_manager.handlers.get(message_type)

                if not handler:
                    logger.error(f"No handler [{message_type}] exists")
                    await socket_manager.send_error(
                        f"Type: {message_type} was not found", websocket
                    )
                    continue

                await handler(
                    websocket=websocket,
                    data=data,
                    client_id=client_id,
                )
            except (JSONDecodeError, AttributeError) as ex:
                logger.exception(f"Websocket error, detail: {ex}")
                await socket_manager.send_error("Wrong message format", websocket)
            except ValueError as ex:
                logger.exception(f"Websocket error, detail: {ex}")
                await socket_manager.send_error("Could not validate incoming message", websocket)

    except WebSocketDisconnect:
        socket_manager.disconnect(client_id, websocket)
        # response_data = {
        #     "action": "DISCONNECTED",
        #     "sender": {"client_id": client_id},
        #     "data": {"message": "Disconnected"},
        # }
        # await socket_manager.broadcast(response_data)
```
