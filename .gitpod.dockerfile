FROM gitpod/workspace-full:latest

ENV PATH=/usr/lib/dart/bin:$PATH

USER root
# Install custom tools, runtime, etc.
RUN apt-get update && apt-get install -y \
        tcl tk expect \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

# install dart
RUN curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list && \
    apt-get update && \
    apt-get -y install  build-essential dart libkrb5-dev gcc make && \
    apt-get clean && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*;
    
USER gitpod
# Apply user-specific settings
#ENV ...

RUN npm install ts-node elm -g 

# Give back control
USER root

