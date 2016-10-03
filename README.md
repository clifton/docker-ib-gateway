# docker-ib-gateway

Docker container that launches the Interactive Brokers Gateway GUI inside of an X virtual frame buffer.

## FIXME: I'm broken

[https://github.com/clifton/docker-ib-gateway/issues/4](There's a conflict with IB provided jar files.)

## Usage

    docker pull clifton/ib-gateway
    docker run -e VNC_PASSWORD=mypass -p 5900:5900 -p 4003:4003 -d clifton/ib-gateway

At this point, you should be able to connect with VNC and log in to the gateway. Once logged in, port 4003 will be open for you to make API calls against.

## Contributing

Send a pull request!
