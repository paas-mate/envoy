FROM ttbb/base

WORKDIR /opt/sh

RUN dnf install -y yum-utils && \
rpm --import 'https://rpm.dl.getenvoy.io/public/gpg.CF716AF503183491.key' && \
curl -sL 'https://rpm.dl.getenvoy.io/public/config.rpm.txt?distro=el&codename=7' > /tmp/tetrate-getenvoy-rpm-stable.repo && \
yum-config-manager --add-repo '/tmp/tetrate-getenvoy-rpm-stable.repo' && \
dnf makecache -y --disablerepo='*' --enablerepo='tetrate-getenvoy-rpm-stable' && \
dnf install -y getenvoy-envoy

ENV ENVOY_HOME /opt/sh/envoy

WORKDIR /opt/sh/envoy
