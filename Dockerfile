FROM python:3.8.7-alpine3.12

LABEL version=1.0
LABEL description="Containerized version of a simple flask app."

WORKDIR /home/app

# Setup virtual environment
ENV VIRTUAL_ENV=/home/app/flask_proj
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

ENV FLASK_APP=app.py

# Install dependencies
COPY requirements.txt . 
RUN pip install --requirement requirements.txt

# Copy the contents from the host to the image's filesystem
COPY . .

EXPOSE 5000

CMD python3 -m flask run
