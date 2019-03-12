FROM gcr.io/cloud-builders/kubectl@sha256:120350a8f2a783b28379e09f5aeb4c999dd6e333057e878ee7b2c296baa1c2c0

# Install Kubeval
ADD https://github.com/garethr/kubeval/releases/download/0.6.0/kubeval-linux-amd64.tar.gz /tmp/kubeval.tar.gz
RUN tar xf /tmp/kubeval.tar.gz -C /usr/local/bin && rm /tmp/kubeval.tar.gz;

# Install Ruby 2.4
RUN add-apt-repository ppa:brightbox/ruby-ng -y
RUN apt-get update && apt-get install ruby2.4 ruby2.4-dev -y && apt-get clean

# Install Bundler
RUN gem update --system && gem install bundler

ENTRYPOINT ["/bin/bash"]
