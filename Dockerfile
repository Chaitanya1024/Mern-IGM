FROM node:22.5.1

# Install necessary libraries for Puppeteer and Chromium
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

# Create a non-root user
RUN useradd -m myuser

# Set up your application
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# Change to the non-root user
USER myuser

# Expose the port
EXPOSE 5000

# Start the application
CMD ["npm", "start"]
