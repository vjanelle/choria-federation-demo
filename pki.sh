#!/bin/sh

rm -rf pki

easyrsa --pki-dir=./pki init-pki

echo "choria" | easyrsa --pki-dir=./pki build-ca nopass

request() {
  echo $1 | easyrsa --pki-dir=./pki --subject-alt-name=DNS:$1 gen-req $1 nopass 
  echo "yes" | easyrsa --pki-dir=./pki --subject-alt-name=DNS:$1 sign-req $2 $1
}

request broker-dmz.choria.local serverClient
request broker-east.choria.local serverClient
request broker-west.choria.local serverClient

request server-dmz.choria.local client
request server-east.choria.local client
request server-west.choria.local client

request privileged.choria client
