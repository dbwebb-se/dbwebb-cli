FROM bats/bats:latest

RUN \ 
  apk \
  --no-cache \
  --update \
  add \
  curl \
  wget \
  rsync \
  git 

#COPY --from=bats/bats /opt/bats-support /opt/bats-support
#COPY --from=bats/bats /opt/bats-assert  /opt/bats-assert
