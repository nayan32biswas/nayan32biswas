# Install AppImage in Ubuntu

In this example we will see how can we install AppImage file in Ubuntu.
We will install cursor ide as an example.

First download the AppImage file.

## Make the file executable and test it locally

```sh
chmod +x cursor-00000.AppImage

```

## Run and test the app

`./cursor-00000.AppImage`


### Error One and Solution

```log
dlopen(): error loading libfuse.so.2

AppImages require FUSE to run. 
You might still be able to extract the contents of this AppImage 
if you run it with the --appimage-extract option. 
See https://github.com/AppImage/AppImageKit/wiki/FUSE 
for more information
```

`sudo apt-get install libfuse2`

### Error Two and Solution

```log
The SUID sandbox helper binary was found, but is not configured correctly. Rather than run without sandboxing I'm aborting now. You need to make sure that /tmp/.mount_cursorKBXjDT/chrome-sandbox is owned by root and has mode 4755.
```

`./cursor-00000.AppImage --no-sandbox`

## Move the executable file to opt

```sh
sudo mv cursor-00000.AppImage /opt/cursor/cursor.AppImage

```

## Add the app entry

`sudo vi /usr/share/applications/cursor.desktop`

```conf
[Desktop Entry]
Name=Cursor
Exec=/opt/cursor/cursor.AppImage --no-sandbox
Icon=/opt/cursor/cursor.jpg
Type=Application
Categories=Development;
```

Add an icon image as you like.
