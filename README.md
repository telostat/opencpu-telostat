# Telostat OpenCPU Docker Image

Building the Docker image:

    docker build -t opencpu-telostat .

Running the Docker image:

    docker run -t -d -p 0.0.0.0:8000:80 --name my-opencpu-telostat opencpu-telostat
