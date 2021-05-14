# Flask

## Flask project

```py
app = Flask(__name__)

from flask import Flask, render_template, request

@app.route("/", methods=["GET"])
def index(*args, **kwargs):
    user_id = "87654321"
    message = "Nayan Biswas"
    reply = "Biswas Nayan"
    save_message_data(user_id, message, reply)
    return {"message": "APP is running."}

if __name__ == "__main__":
    app.run(debug=True)
```

## Flask Model

```py
from flask_sqlalchemy import SQLAlchemy
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///db.sqlite"

db = SQLAlchemy(app)
session = db.session

class User(db.Model):
    __tablename__ = 'user'
    id = db.Column(db.Integer, primary_key=True)
    username_id = db.Column(db.String(50), unique=True, nullable=False)


class Message(db.Model):
    __tablename__ = 'message'
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))
    user = db.relationship("User", backref='messages', lazy=True)

    message = db.Column(db.String, nullable=False)
    reply = db.Column(db.String, nullable=True)

session.add(User(username_id="123123"))
session.commit()
users = User.query.all()
user = User.query.all()[0]
user.id
user.username_id
user.messages # reverse access or like related_name

session.add(Message(user_id=users[0].id, message="demo_message", reply="demo_reply"))
session.commit()
messages = Message.query.all()
message = Message.query.all()[0]

user = User.query.filter(User.username_id=="123123").first()

```
