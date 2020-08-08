#!/usr/bin/env bash

#
docker build -t oudream/getting-started .

docker run -d -p 8902:3000 oudream/getting-started

open http://localhost:8902/tutorial/


