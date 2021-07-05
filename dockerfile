FROM "node"

WORKDIR /app
COPY . /app
EXPOSE 7777
RUN yarn
CMD ["yarn", "start"]
