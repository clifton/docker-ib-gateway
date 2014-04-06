# docker-ib-gateway

Docker container that launches the Interactive Brokers Gateway GUI inside of an X virtual frame buffer.

## Usage

    docker pull clifton/ib-gateway
    docker run -e VNC_PASSWORD=mypass -p 5900:5900 -p 4001:4001 -i -t clifton/ib-gateway

At this point, you should be able to connect with VNC and log in to the gateway. Once logged in, port 4001 will be open for you to make API calls against.

## Contributing

Send a pull request!
