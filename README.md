# Wegue Demo Applications

This repository contains demo applications based on [Wegue](https://www.github.com/meggsimum/wegue).

## Create your own app

The bash-script `create-wegue-app.sh` creates a basic application for you. Make sure to install `git` and `npm` before.

## Upgrade your app to the latest Wegue

Run this commands:

```shell
git submodule update --remote 
```

Create the symlink again:
```shell
rm -rf wegue/app
ln -s ../app wegue/app
```

Afterwards the `wegue` submodule will have the latest commits. Make sure to check that you application afterwards still works as expected.

## Demo: Global Data

We use [Natural Earth](https://www.naturalearthdata.com/) data. Since these layers contain a lot of attributes, we only select a few ones using [ogr2ogr](https://gdal.org/programs/ogr2ogr.html):

```shell
ogr2ogr \
  -f GeoJSON \
  app/static/data/places.json \
  https://raw.githubusercontent.com/JakobMiksch/natural-earth-geojson/master/110m/cultural/ne_110m_populated_places.json \
  -select 'NAME,ADM0NAME,POP_MAX,TIMEZONE'

ogr2ogr \
  -f GeoJSON \
  app/static/data/countries.json \
  https://raw.githubusercontent.com/JakobMiksch/natural-earth-geojson/master/110m/cultural/ne_110m_admin_0_countries.json \
  -select 'NAME,NAME_LONG,POP_EST'

ogr2ogr \
  -f GeoJSON \
  app/static/data/timezones.json \
  https://raw.githubusercontent.com/JakobMiksch/natural-earth-geojson/master/10m/cultural/ne_10m_time_zones.json -select 'NAME'
```

