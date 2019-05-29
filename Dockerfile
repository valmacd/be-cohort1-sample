FROM node:10
# Create app directory
WORKDIR /app

# Install app dependencies
RUN npm install -g nodemon
COPY package.json ./
COPY yarn.lock ./
RUN yarn
COPY knexfile.js ./
RUN yarn run db:migrate:latest

EXPOSE 8080

# Bundle app source
COPY . /app
CMD [ "yarn", "start" ]