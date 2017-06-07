FROM ubuntu:xenial

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yqq sudo git-core subversion build-essential gcc-multilib ccache quilt \
                       libncurses5-dev zlib1g-dev gawk flex gettext wget unzip python vim libssl-dev && \
    apt-get clean && \
    useradd -m lede && \
    echo 'lede ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt
USER lede
RUN cd /home/lede && \
    git clone https://github.com/lede-project/source.git --branch lede-17.01 lede-project && \
    cd lede-project && \
    cp feeds.conf.default feeds.conf && \
    ./scripts/feeds update -a && \
    ./scripts/feeds install -a && \
    wget -c --no-check-certificate https://downloads.lede-project.org/releases/17.01.1/targets/brcm2708/bcm2710/config.seed && \
    cp config.seed .config && \
    rm -rf tmp
WORKDIR /home/lede/lede-project
