FROM node:18-buster

WORKDIR /opt/app

COPY --chown=node:node package.json .
COPY --chown=node:node package-lock.json .
COPY --chown=node:node tsconfig.json .
COPY --chown=node:node prisma ./prisma/

RUN npm install

COPY . .

RUN npm run build

RUN chown node:node /opt/app/

USER node

CMD [ "npm", "run", "start:migrate"]
