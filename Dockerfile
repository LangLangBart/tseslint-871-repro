FROM node:26-alpine
WORKDIR /app
COPY package.json ./
RUN npm install --no-audit --no-fund
COPY --exclude=node_modules --exclude=.git . .

CMD ["sh", "repro.sh"]
