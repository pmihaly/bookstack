FROM node:alpine

RUN yarn global add postgraphile @graphile-contrib/pg-simplify-inflector

EXPOSE 5433
ENTRYPOINT ["postgraphile"]
