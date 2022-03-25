FROM etherpad/etherpad:latest

ARG ETHERPAD_PLUGINS="ep_disable_chat ep_sticky_attributes"

USER root
RUN export DEBIAN_FRONTEND=noninteractive; \
    apt-get -qq update && apt-get -qq --no-install-recommends install libreoffice

RUN npm install --no-save --legacy-peer-deps ${ETHERPAD_PLUGINS} && \
    rm -rf ~/.npm

USER etherpad
