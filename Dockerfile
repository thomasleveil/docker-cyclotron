FROM node:6

MAINTAINER furiousgeorge <furiousgeorgecode@gmail.com>

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN npm install --global gulp

# problem with default version of the mongoose module so changing the version...
RUN git clone https://github.com/ExpediaInceCommercePlatform/cyclotron.git /opt/app \
    && cd /opt/app/cyclotron-svc \
    && sed -i -e 's~"mongoose": .*$~"mongoose": "^4.7.1",~g' package.json \ 
    && npm install \
    && cd /opt/app/cyclotron-site \
    && npm install \
    && gulp build

VOLUME /opt/app/cyclotron-site/_public/
