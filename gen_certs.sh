#!/bin/sh

OUTPUT_DIR="nginx/certs"

mkdir -p $OUTPUT_DIR

openssl genrsa -out $OUTPUT_DIR/server.key 2048
SUBJ="/C=JP/ST=Okinawa/L=Naha/O=docker/OU=docker/CN=docker"
openssl req -new -key $OUTPUT_DIR/server.key -out $OUTPUT_DIR/server.csr -subj "$SUBJ"
openssl x509 -req -in $OUTPUT_DIR/server.csr -signkey $OUTPUT_DIR/server.key -sha256 -days 36500 -out $OUTPUT_DIR/server.crt
