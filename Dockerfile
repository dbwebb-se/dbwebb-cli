FROM bash:latest

COPY src/dbwebb.bash /usr/local/bin/dbwebb3

RUN chmod 755 /usr/local/bin/dbwebb3

ENTRYPOINT ["bash", "/usr/local/bin/dbwebb3"]
