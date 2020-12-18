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

