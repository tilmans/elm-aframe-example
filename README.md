# Simple VR with Elm and A-Frame

## Getting started
This repository is split up into multiple steps, corresponding to the tutorials. You can use the `0_start` directory as a starting point for your own projects. It contains the minimal webpack setup and page structure and has a working Elm app with an (empty) A-Frame scene. To use any of the steps:

    cd 0_start
    npm install
    npm run start
    
Then you can connect to [http://localhost:8080](http://localhost:8080). 

## Connecting from another device
If you want to connect from another device, for example your mobile phone, you need to enable remote connections:

* Open `package.json`
* Look for the line:  
    `"start": "webpack-dev-server --hot --inline --content-base src/",`
* Replace it with:  
    `"start": "webpack-dev-server --hot --host 0.0.0.0 --inline --content-base src/",`
    

