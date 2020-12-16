# Docker file for Sentiment Analysis NLP app
# Author: Muhammad Ali

# Start with latest Ubuntu image
FROM ubuntu:latest

# Install latest updates
RUN apt-get update -y

RUN apt-get install -y software-properties-common
RUN apt-add-repository universe
RUN apt-get update

# Install Python and build libraries
RUN apt-get install -y python3-pip 
RUN apt-get install -y python3-dev 
RUN apt-get install -y build-essential
RUN apt-get install python-virtualenv

RUN virtualenv venv
RUN . venv/bin/activate

# Copy all files from current folder (.) to container's folder (.)
COPY . .

# Set working directory container's default folder (.)
WORKDIR .

# Install the dependencies specified in requirements file
RUN pip3 install -r requirements.txt

# Define which program to run when container starts
ENTRYPOINT [ "python" ]

# Pass file as parameter to the entry command to start your app
CMD [ "app.py" ]
