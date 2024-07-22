FROM node:22.5.1

# Install required libraries
RUN apt-get update && apt-get install -y \
    libdrm2 \
    libnss3 \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    libgbm1 \
    && rm -rf /var/lib/apt/lists/*

# Set up your application
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# Expose the port
EXPOSE 5000

# Start the application
CMD ["npm", "start"]
