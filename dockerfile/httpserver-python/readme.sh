#!/usr/bin/env bash

docker build -t oudream/httpsserver-python:1.0.1 .

docker run -d -p 8901:8901 oudream/httpsserver-python

open http://127.0.0.1:8901/
