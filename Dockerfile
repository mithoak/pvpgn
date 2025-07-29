FROM ubuntu:18.04
RUN apt-get update && apt-get install -y \
  wget \
  tar \
  git \
  cmake \
  make \
  build-essential \
  zlib1g-dev \
  liblua5.1-0-dev \
  mysql-server \
  mysql-client \
  libmysqlclient-dev

RUN wget https://github.com/mithoak/pvpgn/releases/download/v1.99.7.2.1/pvpgn-server-1.99.7.2.1.tar.gz && tar xf pvpgn-server-1.99.7.2.1.tar.gz && rm pvpgn-server-1.99.7.2.1.tar.gz && cd pvpgn-server-1.99.7.2.1 && mkdir build

WORKDIR "/pvpgn-server-1.99.7.2.1/build"
RUN cmake -D CMAKE_INSTALL_PREFIX=/pvpgn -D WITH_MYSQL=true -D WITH_LUA=true ../
RUN make && make install
### BUILD IMAGE FINISHED
### RUN IMAGE
WORKDIR "/pvpgn"
