FROM node:boron

# Create app directory
#RUN mkdir -p /jo-todolist

# Set working dir
WORKDIR /jo-todolist 

# Add the current directory 
ADD . /jo-todolist

# Install app dependencies
COPY package.json /jo-todolist
RUN npm install

EXPOSE 8080
CMD [ "node", "app.js" ]
