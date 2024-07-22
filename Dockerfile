FROM node:18-slim

# Install necessary libraries for Puppeteer
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    ca-certificates \
    libnss3 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libxkbcommon-x11-0 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libxss1 \
    libappindicator3-1 \
    libnspr4 \
    libgbm1 \
    libasound2 \
    libdrm2 \
    libgtk-3-0 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libcups2 \
    libgdk-pixbuf2.0-0 \
    libwayland-client0 \
    libwayland-cursor0 \
    libwayland-egl1 \
    libxtst6 \
    libnss3 \
    libatspi2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Set up your application
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# Install Puppeteer and Chromium
RUN npm install puppeteer

# Expose the port
EXPOSE 5000

# Start the application
CMD ["npm", "start"]
