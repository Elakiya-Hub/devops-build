#!/bin/bash

# This script is used to deploy the application to the server.

docker run -d --name devops-build-container -p 3000:80 devops-build:v1.1.0
