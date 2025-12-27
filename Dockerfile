# Stage 1: Build the Jaspr site
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

# Build the project
RUN jaspr build

# Stage 2: Serve the static files using Nginx
FROM nginx:alpine

# Copy the build output from the build stage to nginx's serving directory
COPY --from=build /app/build/jaspr /usr/share/nginx/html

# Expose port 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
