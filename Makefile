
parcels.sqlite : parcels.geojson
	ogr2ogr -f SQLite $@ $< -dsco SPATIALITE=YES -nlt MULTIPOLYGON

parcels.geojson :
	esri2geojson https://utility.arcgis.com/usrsvcs/servers/62c5543223854bfd87a0f0317a08098e/rest/services/OverlayQuery/MapServer/0 $@ -H 'Referer: https://gisappsecure.ewashtenaw.org/'
