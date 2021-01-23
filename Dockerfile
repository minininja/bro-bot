FROM ubuntu
RUN update-ca-certificates -q && apt install ca-certificates -y
ADD go-discord-bro-bot go-discord-bro-bot
CMD ["./go-discord-bro-bot"]
