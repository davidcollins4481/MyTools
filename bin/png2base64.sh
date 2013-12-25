#!/bin/bash

# add data:image/png;base64,[base64 stuff]
openssl base64 < $1 | tr -d '\n'
