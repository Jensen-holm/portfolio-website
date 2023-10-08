# an official Node.js runtime as the base image
FROM node:16

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the entire project to the container
COPY . .

# Build the Svelte Kit project for production
RUN npm run build

# Expose the port on which your Svelte Kit app will run
EXPOSE 3000

# Start your Svelte Kit app in production mode
CMD ["npm", "run"]