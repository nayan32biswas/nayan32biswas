# [Heroku doc](https://devcenter.heroku.com/articles/getting-started-with-python)

install **heroku**

```bash
    sudo snap install heroku --classic
```

**Login** heroku in CLI

```bash
heroku login
```

create heroku **domain**

```bash
heroku create <domain_name>
```

install **gunicorn**

```bash
pip install gunicorn
```

**Push** your code into heroku

```bash
git push heroku master
```

Create **Procfile** File

```bash
web: gunicorn project.wsgi # in Procfile file assign:
```

Set **enverionment variable** into heroku

```bash
heroku config:set BASE_URL="https://nayan32biswas.herokuapp.com"
heroku config:set API_BASE_URL="https://nayan32biswas.herokuapp.com/api"
heroku config:set DEBUG="False"
```

Use **heroko CLI**

```bash
heroku run bash
```

show **log data**

```bash
heroku logs
```
