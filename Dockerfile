#S.js image
FROM node:24-alpine

# Set working directory
WORKDIR /app

# Copy package.json and lockfile first for better caching
COPY package*.json ./

# Install only production dependencies
RUN yarn install --production

# Copy the rest of the code
COPY . .

# Expose port
EXPOSE 3000

# Run the app
CMD ["node", "src/index.js"]
