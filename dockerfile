FROM ruby:2.4

MAINTAINER luckytianyiyan@gmail.com

ENV COCOAPODS_VERSION 1.5.2

RUN sudo gem install cocoapods --version ${COCOAPODS_VERSION}

CMD ["pod"]