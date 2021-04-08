FROM garethr/kubeval:0.14.0 AS kubeval
FROM gcr.io/cloud-builders/kubectl@sha256:120350a8f2a783b28379e09f5aeb4c999dd6e333057e878ee7b2c296baa1c2c0

COPY --from=kubeval /lib/ld-musl-x86_64.so.1 /lib/
COPY --from=kubeval /kubeval /usr/local/bin/

# Install Ruby 2.4
RUN add-apt-repository ppa:brightbox/ruby-ng -y
RUN apt-get update && apt-get install ruby2.4 ruby2.4-dev -y && apt-get clean

# Install Bundler
RUN gem update --system && gem install bundler

ENTRYPOINT ["/bin/bash"]
