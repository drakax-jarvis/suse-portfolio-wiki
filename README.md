# SUSE Cloud Native Wiki — Docker Build & Run

## Build
```bash
docker build -t suse-cn-wiki .
```

## Run
```bash
docker run -d --name suse-cn-wiki -p 8080:80 suse-cn-wiki
```

Open http://localhost:8080 to view the wiki.

## Stop & Remove
```bash
docker stop suse-cn-wiki && docker rm suse-cn-wiki
```
