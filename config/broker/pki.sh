#!/bin/sh

rm -rf pki
easyrsa --pki-dir=./pki init-pki
easyrsa --pki-dir=./pki build-ca nopass
