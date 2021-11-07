# Supervisor

Supervisor to run something internally in a server. Like **gunicorn** or others.

**Install**

- `sudo apt install supervisor`

## Setup

- `sudo nano /etc/supervisor/conf.d/<program_name>.conf`
```conf
[program:<program_name>]
directory=/home/<directory>/
command=/home/<username>/<project>/<venv>/bin/gunicorn -w 3 run:app
user=<username>
autostart=true
autorestart=true
stopasgroup=true
killasgroup=true
stderr_logfile=/var/log/supervisor/<filename>.err.log
stdout_logfile=/var/log/supervisor/<filename>.out.log
```

**Explenation**

1. <[]>  This is name of your programm.
2. <directory> Derectory where 
3. <command> This is for flask, you can use multiple command.
4. <user> username of os.
5. <autostart> Auto start when pc activate.
6. <autorestart> Auto restart when pc problem arise or down it.
7. <stopasgroup> Stop as group
8. <killasgroup> Kill as group
9. <stderr_logfile> Standard error logfile
10. <stdout_logfile> Standard output logfile


- Create Log files `<filename>.err.log` and `<filename>.out.log`
- `sudo supervisorctl reload` Restart supervisor.
- `sudo supervisorctl start <program_name>` Start program.
- `sudo supervisorctl stop <program_name>` Stop program.
