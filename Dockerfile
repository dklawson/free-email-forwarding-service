
FROM node:8-buster-slim

ENV NODE_ENV=production

RUN mkdir /app

WORKDIR /app

RUN apt-get update \
  && apt-get install -y \
    python \
    spamassassin \
    spamc \
  && rm -rf /var/lib/apt/lists/*

RUN yarn global add pm2

EXPOSE 25  # smtp
EXPOSE 465 # smtps
EXPOSE 587 # submission

COPY ./npmignore /app/npmignore
COPY