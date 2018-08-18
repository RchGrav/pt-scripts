#!/bin/bash
for i in {1..25};do curl -s -w "%{time_total}\n" -o /dev/null https://api.binance.com/api/v1/ping; done