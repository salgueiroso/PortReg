FROM debian:bullseye

LABEL maintainer="Gerador de certificados para o domínio microservico.ti.redeserveloja.com <acacioxp@gmail.com>"

RUN apt-get update
RUN apt-get install -y openssl

VOLUME [ "/certificados" ]

COPY ./run.sh /tmp/run.sh

RUN chmod +x /tmp/run.sh

CMD [ "/tmp/run.sh" ]
