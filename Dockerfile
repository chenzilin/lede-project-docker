FROM ubuntu:xenial

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yqq sudo git-core subversion build-essential gcc-multilib ccache quilt \
                       libncurses5-dev zlib1g-dev gawk flex gettext wget unzip python vim libssl-dev && \
    apt-get clean && \
    useradd -m lede && \
    echo 'lede ALL=NOPASSWD: ALL' > /etc/sudoers.d/lede

USER lede
RUN git config --global user.email "chenzilin115@gmail.com" && \
    git config --global user.name "ZiLin Chen"

RUN cd /home/lede && \
    git clone https://github.com/lede-project/source.git --branch v17.01.2 lede-project && \
    cd lede-project && \
    cp feeds.conf.default feeds.conf && \
    ./scripts/feeds update -a && \
    ./scripts/feeds install -a && \
    rm -rf tmp

COPY dl/dl.tar.bz2.* /home/lede/lede-project/
COPY rpi3-config.seed /home/lede/lede-project/

RUN cd /home/lede/lede-project/ && cat dl.tar.bz2.* | tar xvj && rm dl.tar.bz2.*

WORKDIR /home/lede/lede-project
