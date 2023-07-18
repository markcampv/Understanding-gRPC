#!/bin/bash

HOST_ADDR=$1

# change host addr
if [ "X${HOST_ADDR}" = "X" ];then
  HOST_ADDR=$(cat cmd/product/main.go | grep "@host" | awk '{print $3}')
  HOST_ADDR=$(echo  ${HOST_ADDR} | cut -d ':' -f 1)
else
    sed -i "s/@host .*:8080/@host ${HOST_ADDR}:8080/g" cmd/product/main.go
fi

swag init -g cmd/product/main.go

echo ""
echo "run server and see docs by http://${HOST_ADDR}:8080/swagger/index.html"
echo ""
