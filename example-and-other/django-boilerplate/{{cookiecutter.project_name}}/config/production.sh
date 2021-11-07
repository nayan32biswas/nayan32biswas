npm --prefix ./frontend/ run build
rm -r app/staticfiles/build/
cp -r ./frontend/build ./app/staticfiles/