FROM alpine:3.11

RUN \
	apk add ffmpeg

WORKDIR /app

COPY stream.sh .

CMD ["./stream.sh"]

