ENV R_LIBS_USER=/srv/rlibs
ENV R_LIBS_SITE=/opt/R/4.5.1/lib/R/site-library

RUN mkdir -p /srv/rlibs && chown -R jovyan:users /srv/rlibs

RUN printf '%s\n' '.libPaths(c("/srv/rlibs", "/opt/R/4.5.1/lib/R/site-library", "/opt/R/4.5.1/lib/R/library"))' \
  > /opt/R/4.5.1/lib/R/etc/Rprofile.site