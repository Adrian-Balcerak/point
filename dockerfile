FROM ubuntu:20.04
LABEL maintainer="balcerak12@gmail.com"
RUN apt-get update -y && \
apt-get install -y python3-pip python-dev
# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install -r requirements.txt
COPY . /app
RUN cd /app && python create_tables.py
ENTRYPOINT [ "python3" ]
CMD [ "points_api.py" ]
