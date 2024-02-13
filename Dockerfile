# Use a lightweight base image
FROM nginx

# Copy the HTML file(s) into the container
COPY templatemo_567_nomad_force/index.html /usr/share/nginx/html/




