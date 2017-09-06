FROM gcr.io/cloud-builders/kubectl

# Install Kubeval
ADD https://github.com/garethr/kubeval/releases/download/0.6.0/kubeval-linux-amd64.tar.gz /tmp/kubeval.tar.gz
RUN tar xf /tmp/kubeval.tar.gz -C /usr/local/bin && rm /tmp/kubeval.tar.gz;

# Install Ruby 2.4
RUN add-apt-repository ppa:brightbox/ruby-ng -y
RUN apt-get update && apt-get install ruby2.4 ruby2.4-dev -y && apt-get clean

# Install Bundler
RUN gem update --system && gem install bundler

ENTRYPOINT ["/bin/bash"]
