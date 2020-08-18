#!/usr/bin/env bash

docker build -t oudream/hello-copy:1.0.1 .

docker run -d oudream/hello-copy:1.0.1

