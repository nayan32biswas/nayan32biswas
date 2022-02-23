# Setup firebase

## [Firebase Authentication Doc](https://firebase.google.com/docs/admin/setup)

- Create Firebase Account
- Generate Key File from **Settings** -> **Service Accounts** -> **Generate New Private Key**

### Initicate project

- Call this function in configuration level. This will initiate single time for a project.

```py
def init_firebase_auth():
    from firebase_admin import credentials
    import firebase_admin

    FIREBASE_ACCOUNT_CREDENTIAL_PATH = "/path/to/credentials.json"

    if FIREBASE_ACCOUNT_CREDENTIAL_PATH is None:
        raise Exception("Firebase Credintial is not provided")

    FIREBASE_ACCOUNT_CREDENTIALS = os.path.join(
        BASE_DIR, FIREBASE_ACCOUNT_CREDENTIAL_PATH
    )

    if os.path.exists(FIREBASE_ACCOUNT_CREDENTIALS) is False:
        raise Exception("Invalid Firebase Credintial path")

    try:
        cred = credentials.Certificate(FIREBASE_ACCOUNT_CREDENTIALS)
        firebase_admin.initialize_app(credential=cred)
        print("\tFirebase init")
    except Exception as e:
        print(f"\tFirebase init error: {e}")
```

### Create Id Token

- For testing pourpuse create id token in python

```py
def create_id_token(uid):
    API_KEY = "<API_KEY>"

    token = auth.create_custom_token(uid)
    data = {"token": token, "returnSecureToken": True}

    url = f"https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyCustomToken?key={API_KEY}"
    req = requests.post(url, data, {"Content-Type": "application/json"})
    data = json.loads(req.content.decode())

    return data.get("idToken")
```

### Verify Id Token

- Verify Id Token that sent from frontend

```py
def decode_firetoken(token):
    decoded_token_data = auth.verify_id_token(token)
```
