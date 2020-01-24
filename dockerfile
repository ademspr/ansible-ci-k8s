FROM alpine:3.8

ARG KUBECTL_VERSION=v1.17.0

RUN apk update
RUN apk add curl
RUN apk add python
RUN apk add ansible

COPY . ./app
RUN find /app/scripts/ -type f -exec chmod +x {} \;

ENV KUBECTL_VERSION=${KUBECTL_VERSION}
RUN ./app/scripts/install_kubectl.sh

WORKDIR /app
RUN chmod +x run.sh

#ENTRYPOINT ["./run.sh"]