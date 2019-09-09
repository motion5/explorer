FROM node:10

RUN mkdir -p /app/src

# App directory to hold app code inside image
WORKDIR /app
COPY ./src/ /app/src
COPY ./*.* /app/

RUN npm install --only=production
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY /src/ /app/src
COPY /node_modules /app/node_modules
COPY /*.* /app/

#EXPOSE 80
CMD [ "npm", "start" ]
