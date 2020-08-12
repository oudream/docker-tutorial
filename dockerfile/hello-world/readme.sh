#!/usr/bin/env bash

docker build -t oudream/hello-world:0.01.2 .

docker run oudream/hello-world:0.01.1
