#!/bin/bash

docker build -t textual-inversion . 
sudo docker volume create root-profile
sudo docker volume create conda