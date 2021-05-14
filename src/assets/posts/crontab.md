select terminal editor:
    crontab -e
load crontab:
    crontab file_name.crontab
check running crontab:
    crontab -l
delete crontab:
    crontab -r


this crontab run first and second day of each month.
on crontab.cron:
    0 0 1,2 * * python3 /var/www/html/etl_script/test/crontab_test.py
run file using: crontab crontab.cron


# Example of job definition:
# .-------------------- minute (0 - 59)
# |  .----------------- hour (0 - 23)
# |  |  .-------------- day of month (1 - 31)
# |  |  |      .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |      |  .---- day of week (0 - 6) (Sunday=0 or 7)
# |  |  |      |  |
# *  *  *      *  *   command to be executed
# 0  0  */2    *  *   command1
# 0  0  2-31/2 *  *   command2
# *  *  */2    *  *   command3

0 20 1 8 * python3 /home/nayan32biswas/Dropbox/work/start_operation.py
2 20 1 8 * python3 /home/nayan32biswas/Dropbox/work/start_read_api.py
45 20 1 8 * python3 /home/nayan32biswas/Dropbox/work/start_sql_to_mongo.py

42 18 5 9 * python3 /home/nayan32biswas/Dropbox/work/start_sql_to_mongo.py