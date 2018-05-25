FROM ruby:2.4

MAINTAINER thinkbot@outlook.de

ENV VERSION=1.5.2

RUN gem install cocoapods --version ${VERSION} --no-format-exec

WORKDIR /tmp

ENTRYPOINT ["pod"]
CMD ["--help"]