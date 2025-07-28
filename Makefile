
last_transfer_parcels.geojson : parcels.sqlite
	ogr2ogr -sql "select * from parcels left join LastSale ON pin = pnum" -dialect SQLITE $@ $<

parcels.sqlite : parcels.vrt
	ogr2ogr -f SQLite $@ $< -dsco SPATIALITE=YES -nlt MULTIPOLYGON

parcels.vrt : parcels.geojson LastSale.csv
	vectors2vrt $^ -o $@

parcels.geojson :
	esri2geojson https://utility.arcgis.com/usrsvcs/servers/62c5543223854bfd87a0f0317a08098e/rest/services/OverlayQuery/MapServer/0 $@ -H 'Referer: https://gisappsecure.ewashtenaw.org/'

