FROM python:3.11-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    libgeos-c1v5 \
    libgdal-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir mapproxy Pillow requests

WORKDIR /mapproxy
COPY mapproxy.yaml .

EXPOSE 8080

CMD ["mapproxy-util", "serve-develop", "mapproxy.yaml", "-b", "0.0.0.0:8080"]
