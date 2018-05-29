FROM ruby:2.4

ENV COCOAPODS_VERSION 1.4.0

RUN gem install cocoapods --version ${COCOAPODS_VERSION}