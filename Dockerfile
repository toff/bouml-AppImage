FROM debian:buster

# Install dependencies
RUN set -ex \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install --no-install-recommends -y \
        wget gnupg ca-certificates \
    && echo "Done installing dependencies"

# Install bouml
RUN set -ex \
    && wget -q http://bouml.free.fr/bouml_key.asc -O- | apt-key add - \
    && echo "deb http://bouml.free.fr/apt/buster buster free" | tee -a /etc/apt/sources.list \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install --no-install-recommends -y \
        bouml \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && echo "Done installing bouml"
