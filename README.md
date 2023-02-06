# Wegue Demo

A demo of a webmap using Wegue.

## Setup

```shell
# install dependencies
npm i

# dev setup
npm run serve

# build for production
npm run build
```

## Update to latest Wegue

```shell
# pull the version you want by specifying a commit hash
git pull official-wegue-origin <commit-hash>

# ... solve conflicts if there are any ...
```

## Data

We use [Natural Earth](https://www.naturalearthdata.com/) data. Since these layers contain a lot of attributes, we only select a few ones using [ogr2ogr](https://gdal.org/programs/ogr2ogr.html):

```shell
ogr2ogr \
  -f GeoJSON \
  app/static/data/places.json \
  https://raw.githubusercontent.com/martynafford/natural-earth-geojson/master/110m/cultural/ne_110m_populated_places.json \
  -select 'NAME,ADM0NAME,POP_MAX,TIMEZONE'

ogr2ogr \
  -f GeoJSON \
  app/static/data/countries.json \
  https://raw.githubusercontent.com/martynafford/natural-earth-geojson/master/110m/cultural/ne_110m_admin_0_countries.json \
  -select 'NAME,NAME_LONG,POP_EST'

ogr2ogr \
  -f GeoJSON \
  app/static/data/timezones.json \
  https://raw.githubusercontent.com/martynafford/natural-earth-geojson/master/10m/cultural/ne_10m_time_zones.json -select 'NAME'
```
