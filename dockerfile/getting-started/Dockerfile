FROM node:12-alpine
WORKDIR /app
COPY app /app
RUN yarn install --production
CMD ["node", "src/index.js"]
