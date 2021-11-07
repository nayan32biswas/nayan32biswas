## SSL secure connection

Use Free SSL secure connection from **[Lets Encrypt](https://letsencrypt.org/)**
And use **[certbot](https://certbot.eff.org/instructions)** to setup server.

Flow this **[CertBot Docs](https://certbot.eff.org/instructions)**.
Select Software and OS.

### For Nginx and Ubuntu

```bash
sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository universe
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
```

- `sudo apt-get install certbot python3-certbot-nginx`
- `sudo certbot --nginx`
    1. **Enter email** for urgent renewal.
    2. **A** for Agree
    3. **N** for non share
    4. **1, 2** for multiple domain seperated commas and/or space
    5. **2** for Redirect all as https
- `sudo certbot renew --dry-run`
