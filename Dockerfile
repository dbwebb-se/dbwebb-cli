FROM bash:latest

COPY src/dbw.bash /usr/local/bin/dbw

RUN chmod 755 /usr/local/bin/dbw

ENTRYPOINT ["bash", "/usr/local/bin/dbw"]
