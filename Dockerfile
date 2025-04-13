FROM quay.io/eypzgod/izumi:latest

# Install CA certificates to handle HTTPS requests
RUN apt-get update && apt-get install -y ca-certificates

RUN git clone https://github.com/Akshay-Eypz/izumi-bot /root/bot/
WORKDIR /root/bot/
RUN yarn install --network-concurrency 1
RUN yarn global add pm2@6.0.5

# Use pm2 to run the bot
CMD ["pm2-runtime", "ecosystem.config.js"]
