# FROM ubuntu
FROM solsson/ca-certificates-ubuntu
# RUN apt update -q && apt install ca-certificates -y
ADD go-discord-bro-bot go-discord-bro-bot
CMD ["./go-discord-bro-bot"]
