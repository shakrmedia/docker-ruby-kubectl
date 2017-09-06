FROM gcr.io/cloud-builders/kubectl

RUN add-apt-repository ppa:brightbox/ruby-ng -y
RUN apt-get update && apt-get install ruby2.4 ruby2.4-dev -y && apt-get clean

RUN gem update --system && gem install bundler

ENTRYPOINT ["/bin/bash"]
