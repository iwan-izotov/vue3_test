FROM node:12-stretch

# Surpresses debconf complaints of trying to install apt packages interactively
# https://github.com/moby/moby/issues/4032#issuecomment-192327844
ARG DEBIAN_FRONTEND=noninteractiv

# Копируем общие скрипты
COPY ./shared/ /tmp/scripts/
RUN chmod +x -R /tmp/scripts/

RUN apt-get update -y && apt-get upgrade -y

# Устанавливаем полезные утилиты
RUN /tmp/scripts/install_software.sh

RUN yarn global add @vue/cli

# Устанавливаем рабочую директорию
WORKDIR /home/node/app

EXPOSE 8080

# ENTRYPOINT изменён на bash, так как изначально ENTRYPOINT заточен на запуск js-скрипта (данный вариант нас не устраивал)
ENTRYPOINT ["/bin/bash"]