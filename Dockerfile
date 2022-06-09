FROM node:14
WORKDIR /app
COPY . .
RUN npm install -g typescript
RUN mkdir build
COPY packages*.json ./build
RUN cd build
RUN npm install
RUN cd ..
COPY tsconfig.json .
RUN tsc --build
CMD ["node", "app.js"]
EXPOSE 8080
