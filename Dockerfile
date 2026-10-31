
# Use the required Jupyter SciPy base image
FROM quay.io/jupyter/scipy-notebook:latest

# Set the working directory
WORKDIR /home/jovyan/work/bd-a1

# Copy the requirements file
COPY --chown=jovyan:users requirements.txt .

# Install Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the dataset and notebook
COPY --chown=jovyan:users data/ ./data/
COPY --chown=jovyan:users notebook/ ./notebook/

# Create folders for outputs and screenshots
RUN mkdir -p output/figures screenshots
