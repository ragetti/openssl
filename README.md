# openssl
This is an alpine based openssl. I created this to allow me to create certificates without the need to install in my host OS.

example run: (assumed there is a local directory named cert)

# create private key
docker run -it --rm -v $PWD/cert:/cert ragetti/openssl genrsa -out /cert/private.key 2048

# create private unencrypted key and CSR
docker run -it --rm -v $PWD/cert:/cert ragetti/openssl req -newkey rsa:2048 -nodes -keyout /cert/private.key -new -out /cert/cert.csr

# create certificate using key
docker run -it --rm -v $PWD/cert:/cert ragetti/openssl -key /cert/private.key req -sha256 -x509 -days 365 -out /cert/cert.crt

# create cert and private unencrypted key
docker run -it --rm -v $PWD/cert:/cert ragetti/openssl req -newkey rsa:2048 -nodes -keyout /cert/private.key -sha256 -x509 -days 365 -out /cert/cert.crt

# create pem cert using key
docker run -it --rm -v $PWD/cert:/cert ragetti/openssl -key /cert/private.key req -outform PEM -sha256 -x509 -days 365 -out /cert/cert.pem

