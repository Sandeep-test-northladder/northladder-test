#Maintainer:sandeepjabisetty91@gmail.com

#Base image
FROM node:14-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Environment variables for MongoDB and Redis connection
ENV MONGO_URL mongodb://mongo-hostname:27017/my-database
ENV REDIS_HOST redis-hostname
ENV REDIS_PORT 6379

# Expose the port on which the application will run
EXPOSE 3000

# Start the Node.js application
CMD ["node", "app.js"]
