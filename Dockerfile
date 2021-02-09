# Dockerfile

# set programming language
FROM node:12-alpine

# create & sets folder for files to be stored in within the image
WORKDIR /app

# find dependencies from relevant files
COPY package.json package-lock.json ./

# install dependencies
RUN npm install

# copies all files except the ones referred to in dockerignore
COPY . .

# creates working version of app
RUN npm run build

# redirects all traffic to the host
ENV HOST=0.0.0.0
# exposes port 3000
EXPOSE 3000
# start app
CMD ["npm", "start"]

