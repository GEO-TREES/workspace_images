FROM ghcr.io/nmfs-opensci/container-images/py-rocket-geospatial-2:2026.02.18

USER root
COPY install.R /tmp/install.R
RUN /pyrocket_scripts/install-r-packages.sh /tmp/install.R

USER ${NB_USER}
WORKDIR ${HOME}