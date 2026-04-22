FROM ghcr.io/nmfs-opensci/container-images/py-rocket-geospatial:2025.04.26

USER root

RUN apt-get clean && apt-get update && \
    apt-get install -y --no-install-recommends \
    gdal-bin \
    libgdal-dev \
    libgeos-dev \
    libproj-dev \
    libudunits2-dev \
    build-essential \
    g++ \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY install.R /tmp/install.R

SHELL ["/bin/bash", "-c"]

RUN export PATH=/usr/local/bin:/usr/bin:/bin:$PATH && \
    Rscript /tmp/install.R

USER ${NB_USER}
WORKDIR ${HOME}