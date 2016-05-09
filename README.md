# Get

```
git clone https://github.com/edom/try-phabricator.git
cd try-phabricator
git submodule update --init --depth 1 --recursive
```

# Customize

Edit `docker-compose.yml`.

You may want to change the `environment` and `ports` of `services.http`.

Do not end `phabricator_base_uri` with a slash.

# Build

Building requires [apt-manual-mirror](https://github.com/edom/apt-manual-mirror.git).

# Start

```
cd <THIS-DIR>
docker-compose up -d
```

# Stop

```
cd <THIS-DIR>
docker-compose down
```
