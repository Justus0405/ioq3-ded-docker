### Stage 1: BUILD ###

# Base alpine image as builder for code compilation.
FROM alpine:latest AS builder

# Create non-root user
RUN addgroup -g 1000 ioq3srv && adduser -G ioq3srv -u 1000 ioq3srv -D

# Add compile dependencies
RUN apk add build-base musl-dev git cmake ninja sdl2

# Change to non-root user
USER ioq3srv

# Set the working directory to the home of the non-root user
WORKDIR /home/ioq3srv

# Clone the latest ioq3 code without history
RUN git clone --depth 1 https://github.com/ioquake/ioq3.git

# Change directory to the git repository
WORKDIR /home/ioq3srv/ioq3

# Compile the binary
RUN cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DBUILD_CLIENT="0" -DBUILD_SERVER="1" -DUSE_HTTP="1" -DUSE_CODEC_OPUS="1" -DUSE_VOIP="1" -DCMAKE_INSTALL_PREFIX="./" && cmake --build build

### Stage 2: RUNTIME ###

# Base alpine image as runtime for the binaries
FROM alpine:latest

# Create non-root user
RUN addgroup -g 1000 ioq3srv && adduser -G ioq3srv -u 1000 ioq3srv -D

# Add only the runtime dependencies
RUN apk add sdl2

# Start with the home directory
WORKDIR /home/ioq3srv

# Create base directories
RUN mkdir -p  /home/ioq3srv/ioq3/ /home/ioq3srv/scripts/ /home/ioq3srv/defaults/ /home/ioq3srv/.config/Quake3/baseq3/

# Copy binaries from builder to /home/ioq3srv/ioq3/
COPY --from=builder --chown=ioq3srv:ioq3srv /home/ioq3srv/ioq3/build/Release/* /home/ioq3srv/ioq3/

# Copy scripts to /home/ioq3srv/scripts/
COPY --chmod=755 --chown=ioq3srv:ioq3srv scripts/* /home/ioq3srv/scripts/

# Copy default congis to /home/ioq3srv/defaults/
COPY --chown=ioq3srv:ioq3srv defaults/* /home/ioq3srv/defaults/

# Change to non-root user
USER ioq3srv

# Expose default quake 3 port
EXPOSE 27960/udp

# Start the server and healthcheck
ENTRYPOINT [ "/home/ioq3srv/scripts/start.sh" ]
HEALTHCHECK --start-period=2m --retries=2 --interval=30s CMD /home/ioq3srv/scripts/health.sh
