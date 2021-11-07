## HIEC to PNG

```bash
sudo apt update 
sudo apt install libheif-examples
for file in *.HEIC; do heif-convert $file ${file/%.HEIC/.JPG}; done
```
