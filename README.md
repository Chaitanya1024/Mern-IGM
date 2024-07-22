# Mern-IGM

Invoice Generation Module

## Installation Guide


### Windows Installation

#### 1. Install Node.js

1.  Download the Node.js installer from the [official website](https://nodejs.org/).
2.  Run the installer.
3.  Follow the prompts in the installer (Accept the license agreement, select the destination folder, etc).
4.  Ensure that the box for "Automatically install the necessary tools..." is checked to install `npm`.
5.  Verify installation by opening Command Prompt and typing:
 
    
    ```sh
    node -v
    npm -v
    ``` 
    

#### 2. Install MongoDB

1.  Download MongoDB Community Server from the [MongoDB Download Center](https://www.mongodb.com/try/download/community).
    
2.  Run the downloaded .msi file.
    
3.  Follow the setup wizard instructions:
    
    -   Choose "Complete" setup.
    -   Ensure "Install MongoDB as a Service" is selected.
4.  After installation, MongoDB will be running as a Windows service.
    
5.  Verify MongoDB installation:
    
    -   Open Command Prompt.
    -   Type:  
    ```sh
    mongo --version
    ``` 
    

### Ubuntu Installation

#### 1. Install Node.js

1.  Update the package index:

    ```sh
    sudo apt update
    ``` 
    
2.  Install Node.js and npm:

    ```sh
    sudo apt install nodejs npm
    ``` 
    
3.  Verify installation:
    
    ```sh
    node -v
    npm -v
    ``` 
    

#### 2. Install MongoDB

1.  Import the MongoDB public GPG key:
    
    ```sh
    wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
    ``` 
    
2.  Create a list file for MongoDB:
    
    ```sh
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
    ``` 
    
3.  Reload the local package database:
    
    ```sh
    sudo apt update
    ``` 
    
4.  Install the MongoDB packages:
    
    `sudo apt install -y mongodb-org` 
    
5.  Start MongoDB:

    ```sh
    sudo systemctl start mongod
    ``` 
    
6.  Enable MongoDB to start on boot:
    ```sh
    sudo systemctl enable mongod
    ``` 
    
7.  Verify MongoDB installation:
    ```sh
    mongod --version
    ``` 
    

## Setup

1.  Clone the repository:
    ```sh
    git clone https://[username]@bitbucket.org/falca/coupon-engine-backend.git
    ``` 
2.  Install dependencies:
    ```sh
    npm install
    ``` 
    
## Start
  Project has three separate environments 
- **development**
- **staging**
- **production**
  
So for building and running the app for specific environment run below commands

For starting application in **production** Environment use below command:  
```sh  
npm run start:prod
```  
For starting application in **staging** Environment use below command:  

```sh  
npm run start:stage
```  

For starting application in **development** Environment use below command:  
```sh  
npm run start:dev
```  