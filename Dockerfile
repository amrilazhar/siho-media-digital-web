# Use the official lightweight Node.js 12 image.
# https://hub.docker.com/_/node
FROM node:14-alpine

ENV TZ GMT

RUN apk --update add \
    tzdata \
  && cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


# Create and change to the app directory.
WORKDIR /usr/src/app

# Copy application dependency manifests to the container image.
# A wildcard is used to ensure both package.json AND package-lock.json are copied.
# Copying this separately prevents re-running npm install on every code change.
COPY package*.json ./

RUN npm install --production

# Copy local code to the container image.
COPY . ./

# Run the web service on container startup.
CMD ["node", "index"]
