# FROM ubuntu
FROM kalaksi/ca-certificates
RUN update-ca-certificates
ADD go-discord-bro-bot go-discord-bro-bot
CMD ["./go-discord-bro-bot"]
