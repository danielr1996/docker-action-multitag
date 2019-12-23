#!/bin/sh -l

echo ############################
echo # Docker Action (Multitag) #
echo ############################
echo Image Name: $INPUT_IMAGENAME
echo Image Tags: $INPUT_IMAGETAGS

# Login
echo $INPUT_DOCKERPASSWORD | docker login --username $INPUT_DOCKERUSER --password-stdin

# Build

docker build -t $INPUT_IMAGENAME .

for TAG in $INPUT_IMAGETAGS; do
  # Tag Image
  docker tag $INPUT_IMAGENAME $INPUT_IMAGENAME:$TAG

  # Push Image
  docker push $INPUT_IMAGENAME:$TAG
done