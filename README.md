# Transfer data between [Alpine containers](https://hub.docker.com/_/alpine) using [netcat](https://netcat.ru/developers/docs/#all)

## Run containers
- Add permission to execute:
    ```
    chmod u+x run-containers.sh
    ```
- Run script to start containers:
    ```
    ./run-containers.sh
    ```

## Check results
- Output file `output.log` in directory ./mount:
    ```
    Hello world
    Number 1
    Number 2
    Number 3
    Number 5
    Number 6
    Number 7
    Number 8
    Number 9
    Number 10
    ```

## Scripts to execute transmition
- Netcat server:
    ```
    #!/bin/bash

    touch output.log

    while :; 
    do 
        nc -vlkp 2399 >> output.log #listen 2399 port
    done
    ```

- Netcat client:
    ```
    #!/bin/bash

    sleep 10 #wait before container network configure

    echo 'Hello world' | nc netcat-server 2399 #tranfer text to netcat server
    for i in {1..10}
    do
        echo "Number $i" | nc netcat-server 2399 
        sleep 0.1 #wait between message
    done
    ```
