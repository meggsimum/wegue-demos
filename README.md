# Wegue Demo Applications

This repository contains demo applications based on [Wegue](https://www.github.com/meggsimum/wegue).

## Setup

Make sure `wegue` is cloned as submodule. 

```shell
git clone \
  --recurse-submodules \
  https://bitbucket.org/meggsimum/wegue-demos.git
```

In case you forget to add `--recurse-submodules`, you can clone the submodule afterwards:

```shell
git submodule update --init --recursive
```

Remove `wegue/app`, because we use the `app` folder from our root directory as symlink:

```shell
rm -rf wegue/app

# create symlink
ln -s \
  ../app \
  wegue
```

Install dependencies:
```shell
npm install \
  --prefix ./wegue 
```

Run development server:
```
npm run dev \
  --prefix ./wegue
```

Build the wegue app:
```
npm run build \
  --prefix ./wegue
```

The result is stored in `wegue/build`.


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

