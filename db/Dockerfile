# syntax=docker/dockerfile:1

FROM postgres:12.8-alpine

WORKDIR /docker-entrypoint-initdb.d

COPY ./script.sql .
