FROM ubuntu

MAINTAINER Akanksha Srivastava<akankshaS542@gmail.com>

RUN apt-get update
RUN apt-get upgrade -y 

RUN apt-get install -y nodejs

RUN apt-get update 

RUN apt-get install -y npm

RUN node -v
RUN npm version

RUN mkdir -p /app/sourcecode

WORKDIR /app/sourcecode

COPY ["package.json", "package-lock.json", "./"]

RUN npm install --production

RUN npm install -g create-react-app

COPY . .

RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]
