FROM centos:6
MAINTAINER youyo

ENV RUBY_VERSION=2.4.0
ENV GIT_VERSION=2.11.1

RUN yum install epel-release -y && \
	yum install wget make gcc gcc-c++ kernel-devel zlib-devel openssl-devel readline-devel curl-devel sqlite-devel libyaml-devel libffi-devel rpm-build autoconf expat-devel gettext-devel perl-ExtUtils-MakeMaker -y && \
	cd /usr/local/src/ && \
	wget https://www.kernel.org/pub/software/scm/git/git-${GIT_VERSION}.tar.gz && \
    tar xvzf git-${GIT_VERSION}.tar.gz && \
    cd git-${GIT_VERSION} && \
    make prefix=/usr -j 4 all && \
    make prefix=/usr install && \
    cd /usr/local/ && \
    git clone https://github.com/tagomoris/xbuild.git && \
    /usr/local/xbuild/ruby-install ${RUBY_VERSION} /usr/local && \
    gem install bundler
