#!/bin/bash

docker build -t tanapolsh/node_perf_test --build-arg "NODE_ENV=production" .
docker push tanapolsh/node_perf_test