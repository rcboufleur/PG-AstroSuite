# Use the official PostgreSQL Alpine image as base
FROM postgres:15-alpine

# Install dependencies required for compiling and building extensions
RUN apk update && \
    apk add --no-cache \
      postgresql-dev \
      gcc \
      g++ \
      wget \
      make \
      git \
      gawk \
      bash \
      zlib-dev \
      clang \
      perl \
      patch \
      unzip \
      cfitsio-dev \
      llvm19 \
      llvm19-dev && \
    mkdir -p /usr/lib/llvm19/bin && \

    # Install pg_tap
    rm -rf /tmp/pgtap && \
    git clone --depth 1 https://github.com/theory/pgtap.git /tmp/pgtap && \
      cd /tmp/pgtap && make && make install && \
      cd / && rm -rf /tmp/pgtap && \

    # Install Q3C
    git clone --depth 1 https://github.com/segasai/q3c.git /tmp/q3c && \
      cd /tmp/q3c && make && make install && \
      rm -rf /tmp/q3c && \

    # Install Healpix
    mkdir -p /tmp/healpix && cd /tmp/healpix && \
      wget -O healpix.zip https://netactuate.dl.sourceforge.net/project/healpix/Healpix_3.83/Healpix_3.83_2024Nov13.zip && \
      unzip healpix.zip && \
      cd $(ls -d */ | grep -E 'Healpix_.*') && \
      export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH && \
      export CC=gcc && \
      export C_FITS=-lcfitsio && \
      export C_SHARED=1 && \
      export FITSDIR=/usr/local && \
      export FITSINC=/usr/local/include && \
      CXXFLAGS="-I/usr/local/include" LDFLAGS="-L/usr/local/lib" ./configure --auto=cxx && \
      make && make cpp-all && \
      cp -r include/* /usr/local/include/ && \
      cp -r lib/* /usr/local/lib/ && \

    # Install pgsphere
    git clone --depth 1 https://github.com/postgrespro/pgsphere.git /tmp/pgsphere && \
      cd /tmp/pgsphere && make && make install && \
      rm -rf /tmp/pgsphere

# -------------------------------
# PostGIS Installation (isolated)
# -------------------------------
RUN apk add --no-cache \
      gdal-dev \
      geos-dev \
      proj-dev \
      sfcgal-dev \
      protobuf-c-dev \
      json-c-dev \
      libxml2-dev \
      gettext-dev \
      autoconf \
      automake \
      libtool \
      cmake \
      util-linux-dev \
      linux-headers \
      docbook-xsl-ns && \
    mkdir -p /tmp && cd /tmp && \
    git clone --depth 1 https://git.osgeo.org/gitea/postgis/postgis.git && \
    cd postgis && \
    ./autogen.sh && \
    ./configure --with-pgconfig=$(which pg_config) && \
    make && make install && \
    cd /tmp && rm -rf *

# Expose PostgreSQL port
EXPOSE 5432
