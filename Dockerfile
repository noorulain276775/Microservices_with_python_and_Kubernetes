FROM python:3.10-slim-bullseye

RUN apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
       build-essential default-libmysqlclient-dev pkg-config \
    && pip install --no-cache-dir --upgrade pip

RUN pip install PyJWT flask flask-mysqldb python-dotenv

WORKDIR /app
COPY ./requirements.txt /app
RUN pip install --no-cache-dir -r /app/requirements.txt
COPY . /app
EXPOSE 5000

CMD ["python3", "server.py"]
