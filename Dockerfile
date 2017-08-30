FROM debian:stretch

RUN /bin/true
ENTRYPOINT ["/bin/sleep", "120"]
