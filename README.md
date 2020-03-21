# docker-youtube-stream-webcam

A Docker image to stream your webcam (or another V4L device) straight to YouTube.

You can learn more about YouTube streaming on [YouTube Studio](https://studio.youtube.com/).

## Getting Started
### Building the image

```sh
cd docker-youtube-stream-webcam

docker build -t youtube-stream .
```

### Running the container
```sh
docker run \
  -d \
  -e STREAM_KEY=your-youtube-stream-key \
  -e DEVICE=/dev/video0 \
  --device=/dev/video0 \
  youtube_stream
```

## Compatibility

Currently, this has been tested with:

* Logitech C920 HD

...and probably works with other devices too, but who knows 🤷‍♂️

## Sound
At the moment, the stream will not transmit sound; a dummy audio track is streamed to YouTube. If you want to change this, you can change the `ffmpeg` options in `stream.sh` and rebuild the container.

## Wouldn't a shell script have done?

Probably, if you want to install dependencies yourself, go for it, then run:

```sh
STREAM_KEY=your-youtube-stream-key ./stream.sh
```
