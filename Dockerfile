# Use the official Python image as a base
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install any dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the .pynb file into the container
COPY Interface_using_gradio_SA_Summarisation.ipynb .

# Expose the port that Jupyter will run on
EXPOSE 8888

# Start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''", "--NotebookApp.allow_origin='*'"]

# Run the notebook using nbconvert
RUN jupyter nbconvert --execute Interface_using_gradio_SA_Summarisation.ipynb

EXPOSE 7860

# Use a lightweight base image
FROM nginx:alpine

# Remove the default Nginx configuration file
RUN rm /etc/nginx/conf.d/default.conf

# Copy over the custom Nginx configuration file
COPY nginx.conf /etc/nginx/conf.d/

# Copy the HTML file(s) into the container
COPY index.html /usr/share/nginx/html/

# Expose port  6910
EXPOSE  6910

# Command to run Nginx
CMD ["nginx", "-g", "daemon off;"]


