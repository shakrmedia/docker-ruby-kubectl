FROM ruby:2.4.1-stretch

ADD https://storage.googleapis.com/kubernetes-release/release/v1.7.5/bin/linux/amd64/kubectl /usr/local/bin/kubectl
RUN chmod +x /usr/local/bin/kubectl
