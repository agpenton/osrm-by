FROM osrm/osrm-backend:v5.20.0
LABEL maintainer="Asdrubal Gonzalez"
ENV pbf=belarus-latest.osm.pbf osrm=belarus-latest.osrm version=1.1
VOLUME [ "./:/data" ]
WORKDIR /data
RUN wget http://download.geofabrik.de/europe/${pbf} \
&& osrm-extract -p /opt/car.lua /data/${pbf} \
&& osrm-partition /data/${osrm} \
&& osrm-customize /data/${osrm}
# && osrm-routed --algorithm mld /data/${osrm}
# EXPOSE 5000:5000
