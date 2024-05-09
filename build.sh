#! bash
docker-compose up -d --build | tee ./logs/build.log;
# docker cp eas-builder:/app/assets ./build;