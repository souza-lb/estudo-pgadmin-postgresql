# estudo-pgadmin-postgresql
Ambiente básico para estudo PgAdmin e PostgreSQL

Basicamente há 3 arquivos:

1 - docker-compose-yml: Define as configurações básicas dos contêineres tais como portas
usadas, versões e volumes de persistência.

2 - var_amb.env: Define as variáveis de ambiente dos 2 contêineres, senhas, usuários etc.

3 - dockerfile: Altera os locales da imagem usada no Postgresql
