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

#RUN jupyter notebook --port 7860 notebook.ipynb

# Start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=127.0.0.1", "--port=7860", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''", "--NotebookApp.allow_origin='*'"]

# Run the notebook using nbconvert
#RUN jupyter nbconvert --execute Interface_using_gradio_SA_Summarisation.ipynb

#RUN jupyter nbconvert --execute --allow-errors --to notebook Interface_using_gradio_SA_Summarisation.ipynb
RUN jupyter nbconvert --to notebook --execute --inplace --ExecutePreprocessor.timeout=600 Interface_using_gradio_SA_Summarisation.ipynb

# Use a lightweight base image
FROM nginx

# Copy the HTML file(s) into the container
COPY index.html /usr/share/nginx/html/




