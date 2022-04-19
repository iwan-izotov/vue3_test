
Описание архитектуры
-------------------------
1. Данный docker-compose стек разворачивает «development» среду для работы данного приложения.
Из основных сервисов разворачиваем и конфигурируем **nodejs**.  
Из дополнительных сервисов: **portainer**.  
Описание сервисов и доступ к ним нужно смотреть в разделе **Описание сервисов**.

2. На локальную машину будут проброшены следующие порты:  
     **8080** 
  
  **Важно:** все эти порты должны быть свободны на локальной машине или при установке вылетит ошибка.


Быстрый старт
-------------------------
Для развёртывания приложения необходимо выполнить следующие шаги:
1. Собрать и запустить сервисы из `docker-compose.yml`. Это можно сделать одной из следующих команд: `make docker-up` или `docker-compose up -d --build`.
2. Необходимо установить npm-зависимости. Это можно сделать следующей командой: `make yarn-install`. 
3. Заходим на контенейр **nodejs**. Это можно сделать следующей командой: `make console`. 
4. Запускаем скрипт для тестов. Это можно сделать следующей командой: `node index.js`.


Описание сервисов
-------------------------

###1 nodejs  
**IP:** 18.10.16.2 
**Описание:** В контейнере установлен nodejs, npm, yarn

Nodejs доступен только внутри контейнера. Чтобы зайти внутрь контенера и выполнить какой-нибудь js-скрипт, можно воспользоваться следующими командами:
1. `make console` - заходим на контенейр **nodejs**  
2. `yarn serve` - запускаем сервер
    
###2 portainer
**IP:** 18.10.16.3
**Описание:** В контейнере установлен portainer (веб-интерфейс для управления Docker-ом)  

Учётные данные для доступа к веб-интерфейсу следующие, login: `admin`, пароль: `password`.

Для доступа к веб-интерфейсу нужно использовать ip контейнера (только для Linux-систем), url: `http://10.10.16.3:9000`
