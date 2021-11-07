# Django

## Common Command

```bash
pip install Django
django-admin startproject myproject
python manage.py startapp myapp
python manage.py makemigrations
python manage.py migrate
python manage.py createsuperuser
python manage.py runserver
python manage.py collectstatic
python manage.py changepassword <user_name>
```
## Models

### Model def

```py
from django.db import models
from django.db.models import Count
from django.db.models import Prefetch
from django.db.models.functions import Lower

class Blog(models.Model):
    name = models.CharField(max_length=100)
    tagline = models.TextField()

class Author(models.Model):
    name = models.CharField(max_length=200)
    email = models.EmailField()

class Entry(models.Model):
    blog = models.ForeignKey(Blog, on_delete=models.CASCADE)
    headline = models.CharField(max_length=255)
    body_text = models.TextField()
    pub_date = models.DateField()
    mod_date = models.DateField()
    authors = models.ManyToManyField(Author)
    number_of_comments = models.IntegerField()
    number_of_pingbacks = models.IntegerField()
    rating = models.IntegerField()

class Blog(models.Model):
    name = models.CharField(max_length=100)
    tagline = models.TextField()

class Author(models.Model):
    name = models.CharField(max_length=200)
    email = models.EmailField()

class Entry(models.Model):
    blog = models.ForeignKey(Blog, on_delete=models.CASCADE)
    headline = models.CharField(max_length=255)
    body_text = models.TextField()
    pub_date = models.DateField()
    mod_date = models.DateField()
    authors = models.ManyToManyField(Author)
    number_of_comments = models.IntegerField()
    number_of_pingbacks = models.IntegerField()
    rating = models.IntegerField()
```
### Save & Update
```py
b = Blog(name='Beatles Blog', tagline='All the latest Beatles news.')
b.save()  # Django doesn’t hit the database until you explicitly call save()

entry = Entry.objects.get(pk=1)
cheese_blog = Blog.objects.get(name="Cheddar Talk")
entry.blog = cheese_blog
entry.save()

joe = Author.objects.create(name="Joe")
entry.authors.add(joe)

# To add multiple records to a ManyToManyField in one go, include multiple arguments in the call to add()
john = Author.objects.create(name="John")
paul = Author.objects.create(name="Paul")
entry.authors.add(john, paul, ...)
```

### Get or Filter

```py
def filter_option():
    # here somthing i means case in sensetive
    (__exact, __iexact) 
    (__contains, __icontains)

def all():
    Entry.objects.all()
    entry_list = list(Entry.objects.all())

def reverse():
    my_queryset.reverse()[:5]

def filter():
    Entry.objects.filter(pub_date__year=2006)
    # With the default manager class, it is the same as:
    Entry.objects.all().filter(pub_date__year=2006)
    Entry.objects.filter(pub_date__year=2005).order_by('-pub_date', 'headline')
    Blog.objects.filter(entry__headline__contains='Lennon', entry__pub_date__year=2008)

def order_by():
    Entry.objects.order_by('?')  # randomly get data. very slow.
    Entry.objects.order_by('blog__name', 'headline')  # first order by blog__name and then headline
    Entry.objects.order_by(Coalesce('summary', 'headline').asc())
    Entry.objects.order_by(Coalesce('summary', 'headline').desc())

    Entry.objects.order_by(Lower('headline').desc())  # here Lower make all to lowercase of headline field and then order them by condition


def exclude():
    Entry.objects.exclude(pub_date__gt=datetime.date(2005, 1, 3), headline='Hello')
    SELECT * WHERE NOT(pub_date > '2005-1-3' AND headline='Hello')

    Entry.objects.exclude(pub_date__gt=datetime.date(2005, 1, 3)).exclude(headline='Hello')
    SELECT * WHERE NOT pub_date > '2005-1-3' AND NOT headline = 'Hello'

def annotate():
    q = Blog.objects.annotate(Count('entry'))  # read data derectly
    name_of_first_blog_entry = q[0].name
    number_of_entries_on_the_first_blog = q[0].entry__count

def distinct():
    Author.objects.distinct()
    Entry.objects.order_by('blog').distinct('blog')
    Entry.objects.filter(pub_date__year=2005).order_by('-pub_date', 'headline').distinct('blog')

def values():
    Blog.objects.values()
    Blog.objects.filter(name__startswith='Beatles').values()
    Blog.objects.values(lower_name=Lower('name'))  # <QuerySet [{'lower_name': 'beatles blog'}]>
    Blog.objects.values('name__lower')  # <QuerySet [{'name__lower': 'beatles blog'}]>

def values_list():
    Entry.objects.values_list('id', 'headline')  # <QuerySet [(1, 'First entry'), ...]>
    Entry.objects.values_list('id', Lower('headline'))  # <QuerySet [(1, 'first entry'), ...]>
    Entry.objects.values_list('id').order_by('id')  # <QuerySet[(1,), (2,), (3,), ...]>
    Entry.objects.values_list('id', flat=True).order_by('id')  # <QuerySet [1, 2, 3, ...]>
    Author.objects.values_list('name', 'entry__headline')  # <QuerySet [('Noam Chomsky', 'Impressions of Gaza'), ('Don Quixote', None), ...]>

def union():
    qs1 = Author.objects.values_list('name')
    qs2 = Entry.objects.values_list('headline')
    qs3 = qs1.union(qs2).order_by('name')

    qs1.intersection(qs2, qs3)

    qs1.difference(qs2, qs3)

def select_related():
    # regular work
    e = Entry.objects.get(id=5)  # Hits the database.
    b = e.blog  # Hits the database again to get the related Blog object.

    # using select_related
    e = Entry.objects.select_related('blog').get(id=5)  # Hits the database.
    b = e.blog  # Doesn't hit the database, because e.blog has been prepopulated # in the previous query.

    e = Entry.objects.select_related('blog', 'other_rlated_models', ...).get(id=5)

    # Other example
    # Hits the database with joins to the author and hometown tables.
    b = Book.objects.select_related('author__hometown').get(id=4)
    p = b.author         # Doesn't hit the database.
    c = p.hometown       # Doesn't hit the database.

    # Without select_related()...
    b = Book.objects.get(id=4)  # Hits the database.
    p = b.author         # Hits the database.
    c = p.hometown       # Hits the database.

def prefetch_related():  # very complex system but fast.
    class Topping(models.Model):
        name = models.CharField(max_length=30)

    class Pizza(models.Model):
        name = models.CharField(max_length=50)
        toppings = models.ManyToManyField(Topping)

    Pizza.objects.all().prefetch_related('toppings')  # use prefetch_related when we aree using manyTomany relation.
    Restaurant.objects.prefetch_related(Prefetch('pizzas__toppings'))
    Pizza.objects.prefetch_related(Prefetch('restaurants', queryset=Restaurant.objects.select_related('best_pizza')))

    vegetarian_pizzas = Pizza.objects.filter(vegetarian=True)
    Restaurant.objects.prefetch_related(Prefetch('pizzas', to_attr='menu'), Prefetch('pizzas', queryset=vegetarian_pizzas, to_attr='vegetarian_menu'))

    vegetarian_pizzas = Pizza.objects.filter(vegetarian=True)
    Restaurant.objects.prefetch_related(Prefetch('pizzas', queryset=vegetarian_pizzas, to_attr='vegetarian_menu'),     'vegetarian_menu__toppings')


def annotate_vs_values():
    Blog.objects.values('entry__authors', entries=Count('entry'))  # <QuerySet [{'entry__authors': 1, 'entries': 20}, {'entry__authors': 1, 'entries': 13}]>
    Blog.objects.values('entry__authors').annotate(entries=Count('entry'))  # <QuerySet [{'entry__authors': 1, 'entries': 33}]>


def annotate_with_values():
    Blog.objects.values('entry__authors__name__lower').annotate(entries=Count('entry'))  # <QuerySet [{'entry__authors__name__lower': 'test author', 'entries': 33}]>
    Blog.objects.values(entry__authors__name__lower=Lower('entry__authors__name')).annotate(entries=Count('entry'))  # <QuerySet [{'entry__authors__name__lower': 'test author', 'entries': 33}]>
    Blog.objects.annotate(entry__authors__name__lower=Lower('entry__authors__name')).values('entry__authors__name__lower').annotate(entries=Count('entry'))  # <QuerySet [{'entry__authors__name__lower': 'test author', 'entries': 33}]>


def select_related_with_filter():
    Entry.objects.filter(pub_date__gt=timezone.now()).select_related('blog')
```


# Websocket
```bash
pip install -U channels
```


```python
#  push_notifications/settings.py
INSTALLED_APPS = (
    ...
    'channels',
    ...
)
ASGI_APPLICATION = "push_notificationios.routing.application"

# channel configuration
CHANNEL_LAYERS = {
    "default": {
        "BACKEND": "channels_redis.core.RedisChannelLayer",
        "CONFIG": {
            "hosts": [("127.0.0.1", 6379)],
        },
    },
}
```

```python
#  push_notifications/routing.py
from channels.auth import AuthMiddlewareStack
from channels.routing import ProtocolTypeRouter, URLRouter
from accounts.websocket import routing 

application = ProtocolTypeRouter({
    'websocket': AuthMiddlewareStack(
        URLRouter(routing.websocket_urlpatterns)
    ),
})
```

```python
#  accounts/websocket/routing.py
from django.urls import re_path
from .consumers import ChatConsumer
websocket_urlpatterns = [
    re_path(r'ws/chat/(?P<chat_room>\w+)/$', ChatConsumer),
]
```

**Backend Part**

```python
#  accounts/websocket/consumers.py
import jwt
import json
import datetime
from django.conf import settings
from django.contrib.auth import get_user_model
from channels.consumer import AsyncConsumer
from channels.db import database_sync_to_async

from accounts.models import Message
from accounts.serializers import MessageSerializer

User = get_user_model()

"""
to use socket IO use <<AsyncConsumer>> to work asynchronous.
if we use <<await>> then parrent function should be <<async>>
Must use database_sync_to_async and use as decorator to read something from database. 
And use async and await when we called database_sync_to_async decorator function.
"""


class ChatConsumer(AsyncConsumer):
    async def send_websocket_data(self,  data):
        await self.send({"type": "websocket.send", "text": json.dumps(data)})

    # build in function
    async def websocket_connect(self, event):
        await self.send({"type": "websocket.accept", "token": "token"})
        self.user = None
        self.chat_room = self.scope["url_route"]["kwargs"]["chat_room"]
        self.sender, self.receiver = self.chat_room.split("__")

        await self.channel_layer.group_add(self.chat_room, self.channel_name)
        send_data = {"message": "ChatRoom created"}
        await self.send_websocket_data(send_data)

    def extract_user(self, token):
        if token:
            try:
                payload = jwt.decode(
                    token,
                    settings.SECRET_KEY,
                    algorithms=[settings.JWT_ALGORITHM]
                )
            except (jwt.DecodeError, jwt.ExpiredSignatureError):
                return ValueError({'message': 'Token is invalid'}, status=400)
            username = payload['username']
            return username
        return None

    async def check_auth(self, headers):
        if headers:
            token = headers.get("token")
        self.username = self.extract_user(token)
        if (self.username == self.receiver):
            self.sender, self.receiver = self.receiver, self.sender
        self.user = await self.get_user(self.username)
        self.receiver_user = await self.get_user(self.receiver)

    # build in function
    # this function called one time when some message onthe room
    async def websocket_receive(self, event):
        received_data = event.get("text")
        if received_data is not None:
            received_dict = json.loads(received_data)
            await self.check_auth(received_dict.get("headers"))
            if self.user is not None and received_dict.get("data"):
                message = received_dict.get("data").get("message")

                message_data = await self.create_message(message)
                message_data["__type__"] = "MESSAGE"

                await self.channel_layer.group_send(
                    self.chat_room,
                    {
                        "type": "chat_message",
                        "send_data": message_data
                    }
                )

    # this is user define function. called based on type when type==chat_message
    # this function call multiple time based on number of user on the room
    # and assigned data change based on user data
    async def chat_message(self, event):
        send_data = event.get("send_data")
        await self.send_websocket_data(send_data)

    # build in function
    async def websocket_disconnect(self, event):
        print("disconnect", event)

    # this remove too many request or memory loss or something bad
    @database_sync_to_async
    def get_message(self, other_user):
        return other_user

    @database_sync_to_async
    def get_user(self, username):
        user = User.objects.filter(username=username).first()
        return user

    @database_sync_to_async
    def create_message(self, message):
        if len(message) and self.user != self.receiver_user:
            message_instance = Message.objects.create(
                receiver=self.receiver_user,
                sender=self.user,
                message=message
            )
            data = MessageSerializer(message_instance).data
            return data
```


**Front End part**

```js

import React, { Component } from 'react'
import { connect } from 'react-redux'

import store from "../../store"
import { FETCH_NEW_MESSAGE } from "../../store/types"
import { wsSocket, wsSendMessage } from "../../store/actions/webSocketActions"
import { fetchMessageList, sendMessage } from "../../store/actions/messageActions"

import MessageList from "./MessageList"



export class Message extends Component {
    state = {
        data: {
            message: ""
        },
        URL: `ws://127.0.0.1:8000/ws/chat/nayan/`
    }
    getAuthToken = () => {
        const token = localStorage.getItem('auth_token');
        return token ? token : "";
    }
    componentDidMount() {
        const users = [this.props.auth_username, this.props.username]
        users.sort()
        const chatRoom = `${users[0]}__${users[1]}`
        const URL = `ws://127.0.0.1:8000/ws/chat/${chatRoom}/`

        // console.log(URL)

        this.setState({ URL })
        // const token = this.getAuthToken()
        this.ws = new WebSocket(URL)

        this.props.fetchMessageList(this.props.username)
        // ------------------------------------------------
        this.ws.onopen = () => {
            console.log('connected')
        }
        this.ws.onmessage = event => {
            let data = event.data
            data = JSON.parse(data)
            // console.log(data)
            if (data.__type__ && data.__type__ === "MESSAGE") {
                delete data["__type__"]
                store.dispatch({ type: FETCH_NEW_MESSAGE, payload: data })
            }
        }
        this.ws.onclose = () => {
            console.log('disconnected')
            this.setState({ ws: new WebSocket(URL) })
        }
    }
    handelMessageChange = (event) => {
        this.setState({
            data: {
                ...this.state.data,
                message: event.target.value
            }
        })
    }
    onSubmit = (event) => {
        event.preventDefault()
        const sendData = {
            data: { ...this.state.data },
            headers: { "token": this.getAuthToken() }
        }
        // this.props.sendMessage(this.props.username, sendData)
        this.ws.send(JSON.stringify(sendData))
        this.setState({
            data: {
                ...this.state.data,
                message: ""
            }
        })
    }
    render() {
        return (
            <div className="container">
                <div>
                    <MessageList
                        messageList={this.props.messageList}
                    />
                </div>
                <form onSubmit={this.onSubmit}>
                    <div className="form-group">
                        <textarea
                            onChange={this.handelMessageChange}
                            value={this.state.data.message}
                            type="text" className="form-control" id="message" placeholder="message"
                        />
                    </div>
                    <button onClick={this.onSubmit}>Send</button>
                </form>
            </div>
        )
    }
}

const mapStateToProps = (state) => {
    return {
        auth_username: state.auth.user.username,
        messageList: state.message.messageList
    }
}

const mapDispatchToProps = {
    wsSocket,
    wsSendMessage,
    sendMessage,
    fetchMessageList,
}

export default connect(mapStateToProps, mapDispatchToProps)(Message)

```

## Scale up Django app
### Basic Scaling
1. Optimize query
2. Install Memcached. Check that caching is working by returning current timestamp.
   - Django caching work by looking at cookis header.
3. Install **New Ralic** or something that will check **server status**.
4. Add **redis & celery** for **long processing**. And install **celery Flower** To monitor it.
### Advence Scaling
1. Separate PG_DB server and add PGBouncer.
   - Add more DB server if needed. Add implement **streming replication**.
2. Add separate server for executig Async processing.
3. Separate Nginx server from app server.
4. For further improvement add multiple app server (App server only have caching and code).

## Problem & Solution

1. Problem:
    CSRF or Forbiden:
    If you login with admin in django admin and you try to registration with same browse you may get invalid <CSRFtoken> or <Forbiden> error.
**Solution**
    logout from django admin.

2. Problem:
    Redis error:
    AttributeError: 'str' object has no attribute 'items'.
**Solution**
    install letest celery.

3. Problem & Solution
    Serializer error:
    If you set somting editable=Flase in model then serializer 
    do not return this field as validate data or data.

4. Problem
    No module named pkg_resources:
**Solution**
    pip uninstall -y setuptools
    pip install setuptools==39.1.0
