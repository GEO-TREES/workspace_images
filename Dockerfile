FROM ghcr.io/nmfs-opensci/container-images/py-rocket-geospatial:2025.04.26

USER root

RUN apt-get clean && apt-get update && \
    apt-get install -y --no-install-recommends \
    gdal-bin \
    libgdal-dev \
    libgeos-dev \
    libproj-dev \
    proj-bin \
    proj-data \
    libudunits2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    build-essential \
    g++ \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY install.R /tmp/install.R

SHELL ["/bin/bash", "-c"]

RUN env -i \
    HOME=/root \
    PATH=/usr/local/bin:/usr/bin:/bin \
    GDAL_CONFIG=/usr/bin/gdal-config \
    PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/share/pkgconfig \
    LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:/usr/lib:/lib \
    Rscript /tmp/install.R

USER ${NB_USER}
WORKDIR ${HOME}