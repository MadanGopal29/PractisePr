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

#Making Jupyter run on the specific port
RUN jupyter notebook --port 7860 Interface_using_gradio_SA_Summarisation.ipynb

# Run the notebook using nbconvert
RUN jupyter nbconvert --execute Interface_using_gradio_SA_Summarisation.ipynb




