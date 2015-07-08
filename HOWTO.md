# how to build & run

 1. [Install Docker](https://docs.docker.com/installation/)
 2. Build `docker build --tag yaml-sucks .`
 3. Run:

    docker run \
        --rm \
        --volume `pwd`:/app \
        yaml-sucks

This will regenerate `README.md`.
