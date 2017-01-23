#!/bin/bash
# docker run -d -p 3000:3000 tanapolsh/node_perf_test

echo "=============================================="
echo "             Run fast endpoint"
echo "=============================================="
wrk -c 500 -t 10 -d 10s http://localhost:3000/fast
echo "=============================================="
echo "             Run slow endpoint"
echo "=============================================="
wrk -c 500 -t 10 -d 10s http://localhost:3000/slow