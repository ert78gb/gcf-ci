# Use an official Google Cloud SDK as a parent image
FROM google/cloud-sdk

#add user node and use it to install node/npm and run the app
RUN useradd --home /home/node -m -U -s /bin/bash node

#run all of the following commands as user node from now on
USER node

# Install NVM Node.js version manager and Node.js 6.11.2
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash \
    && export NVM_DIR="$HOME/.nvm" \
    && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" \
    && nvm install 6.11.2

ENTRYPOINT ["/bin/bash"]
