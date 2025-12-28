# Stage 1: Build
FROM dart:stable AS build

# Install jaspr_cli
RUN dart pub global activate jaspr_cli

# Set the path to include dart pub global binaries
ENV PATH="$PATH":"/root/.pub-cache/bin"

# Set the working directory
WORKDIR /app

# Copy pubspec files and get dependencies
COPY pubspec.* ./
RUN dart pub get

# Copy the rest of the application code
COPY . .

# Build for server mode
RUN jaspr build --verbose

# Stage 2: Run
FROM scratch

# Copy the runtime dependencies (like SSL certs) if needed, 
# although for a simple jaspr server, the binary might be sufficient.
# However, Jaspr's server build produces a binary and a 'web' folder for assets.
COPY --from=build /runtime/ /
COPY --from=build /app/build/jaspr/ /app/

# Set the working directory
WORKDIR /app

# Expose port 8080 (Cloud Run default)
EXPOSE 8080

# Start the server
# The jaspr build in server mode creates an executable named 'app' by default in the output dir
CMD ["./app"]
