FROM ubuntu:xenial

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yqq sudo git-core subversion build-essential gcc-multilib ccache quilt \
                       libncurses5-dev zlib1g-dev gawk flex gettext wget unzip python vim libssl-dev && \
    apt-get clean && \
    useradd -m chenzilin && \
    echo 'chenzilin ALL=NOPASSWD: ALL' > /etc/sudoers.d/chenzilin

USER chenzilin
RUN git config --global user.email "chenzilin115@gmail.com" && \
    git config --global user.name "ZiLin Chen"

RUN cd /home/chenzilin/ && \
    wget -c --no-check-certificate https://codeload.github.com/lede-project/source/zip/v17.01.2 && \
    unzip source-17.01.2.zip && mv source-17.01.2 lede-project && rm source-17.01.2.zip v17.01.2 && \
    cd lede-project/ && git init . && git add -A . && git commit -am "initial commit based on v17.01.2"

RUN cd /home/chenzilin/lede-project/ && \
    cp feeds.conf.default feeds.conf && \
    ./scripts/feeds update -a && \
    ./scripts/feeds install -a && \
    rm -rf tmp

COPY rpi3-config.seed /home/chenzilin/lede-project/

COPY dl/dl.tar.bz2.* /home/chenzilin/lede-project/
RUN cd /home/chenzilin/lede-project/ && cat dl.tar.bz2.* | tar xvj && rm dl.tar.bz2.*

WORKDIR /home/chenzilin/lede-project
