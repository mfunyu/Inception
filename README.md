# Inception
[![mfunyu's 42 Inception Score](https://badge42.vercel.app/api/v2/cl39q9bth003509lhnivqm9hg/project/2536309)](https://github.com/JaeSeoKim/badge42)

Level 5 project @42Tokyo

Notion: [Inception Log >>>](https://www.notion.so/Inception-Reviewee-bb1ff70bbb374ea3802ee1fd8e72f161)

## Project Overview

Set up a small infrastructure composed of different services: Nginx, Wordpress, and Mariadb

<img width="450" alt="SS 2022-05-17 15 13 53" src="https://user-images.githubusercontent.com/60470877/168741508-12e2fdca-274b-4ac5-af23-57d1e330bf37.png">

### Directory structure

```bash
$ tree
.
├── Makefile
└── srcs
    ├── docker-compose.yml
    └── requirements
        ├── mariadb
        │   ├── Dockerfile
        │   └── setup.sh
        ├── nginx
        │   ├── Dockerfile
        │   └── nginx.conf
        ├── tools
        │   ├── clean.sh
        │   └── setup.sh
        └── wordpress
            ├── Dockerfile
            ├── setup.sh
            └── www.conf
```

