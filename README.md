# openssl
This is an alpine based openssl. I created this to allow me to create certificates without the need to install in my host OS.

example run: (assumed there is a local directory named cert)

# private key
docker run -it -v $PWD/cert:/cert ragetti/openssl req -out /cert/cert.csr -new -newkey rsa:2048 -nodes -keyout /cert/private.key

# signed certificate
docker run -it -v $PWD/cert:/cert ragetti/openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout /cert/private.key -out /cert/cert.crt


