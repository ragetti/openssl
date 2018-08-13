# openssl
This is an alpine based openssl. I created this to allow me to create certificates without the need to install in my host OS.

example run: (assumed there is a local directory named cert)

# private key
docker run -it --rm -v $PWD/cert:/cert ragetti/openssl genrsa -out /cert/private.key 2048

# private key and CSR - unencrypted key
docker run -it --rm -v $PWD/cert:/cert ragetti/openssl req -new -newkey rsa:2048 -nodes -keyout /cert/private.key -out /cert/cert.csr

# certificate - using key
docker run -it --rm -v $PWD/cert:/cert ragetti/openssl req -x509 -days 365 -key /cert/private.key -out /cert/cert.crt

# create cert and key
docker run -it --rm -v $PWD/cert:/cert ragetti/openssl req -newkey rsa:2048 -nodes -keyout /cert/private.key -x509 -days 365 -out /cert/cert.crt

# pem certificate - using key
docker run -it --rm -v $PWD/cert:/cert ragetti/openssl req -outform PEM -x509 -days 365 -key /cert/private.key -out /cert/cert.pem

