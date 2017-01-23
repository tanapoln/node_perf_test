node_perf_test
===

I'm wondering when I fire many requests and just forgot it! why it cause so much performance penalty to application.

And how can I fix it?

Please see code at `index.js` file, it's super easy to understand.

## Running server
Simply run:
```
docker run -d -p 3000:3000 tanapolsh/node_perf_test
```

## Benchmarking
You can bench using `wrk` with following command:
```
wrk -c 500 -t 10 -d 10s http://localhost:3000/fast
```
And
```
wrk -c 500 -t 10 -d 10s http://localhost:3000/slow
```

And here's result on my machine (MBP early 2015)

```
Running 10s test @ http://localhost:3000/fast
  10 threads and 500 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   103.83ms   59.20ms 698.91ms   85.15%
    Req/Sec   201.36    113.56   750.00     79.63%
  19531 requests in 10.06s, 3.73MB read
  Socket errors: connect 0, read 659, write 0, timeout 0
Requests/sec:   1941.10
Transfer/sec:    379.12KB


Running 10s test @ http://localhost:3000/slow
  10 threads and 500 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   407.06ms  228.33ms   1.23s    74.15%
    Req/Sec    37.18     29.17   136.00     70.59%
  2847 requests in 10.09s, 556.05KB read
  Socket errors: connect 0, read 2900, write 1, timeout 0
Requests/sec:    282.10
Transfer/sec:     55.10KB
```