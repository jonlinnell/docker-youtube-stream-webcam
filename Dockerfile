FROM alpine:3.11

RUN \
	apk add ffmpeg v4l-utils

WORKDIR /app

COPY stream.sh .

CMD ["./stream.sh"]

