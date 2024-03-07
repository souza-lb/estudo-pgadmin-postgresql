# estudo-pgadmin-postgresql
Ambiente básico para estudo PgAdmin4 v8.3  e PostgreSQL v16.2

Basicamente há 4 arquivos:

* docker-compose-yml: Define as configurações básicas dos contêineres tais como portas
usadas, versões e volumes de persistência.

* var_amb.env: Define as variáveis de ambiente dos 2 contêineres, senhas, usuários etc.

* dockerfile: Altera os locales da imagem usada no Postgresql

* README.md: Estas instruções que você encontra abaixo.

Para criar o ambiente você vai precisar basicamente de:

* git
* docker
* docker-compose

Estou usando um Debian 12 nesse caso para instalar esses pacotes
basta rodar:

sudo apt install git docker.io docker-compose

Com o git instalado basta clonar este repositório com:

git clone https://github.com/souza-lb/estudo-pgadmin-postgresql.git

Dentro da pasta do repositório que acabou de clonar execute:

sudo docker-compose build

Isso vai damorar um pouco na primera vez pois vai baixar as imagens para o repositório local.

após finalizar rode para subir os contêineres:

sudo docker-compose up

Você também pode rodar o comando acima com o parâmetro -d como resultado seu terminal fica livre

sudo docker-compose up -d

Para interromper todos os contêineres rodando use:

sudo docker stop $(sudo docker ps -aq)

Não feche a janela do terminal apenas minimize. 
Em seguida abra o navegador e acesse: localhost:80.
Se você seguiu todos os passos até aqui você terá a tela de login do PgAdmin4 no seu navegador e seu banco rodando.

Siga as imagens e configure o novo servidor no PgAdmin4

Lembrando que para logar na tela inicial do pgadmin você usa os dados abaixo:

Username/Email Adress: admin@admin.com
senha: postgres

Apos iniciar use a opção adicionar novo servidor e use os dados abaixo:

Na aba General:

nome: postgres

Na aba Conexão:

host: postgresql-16.2

port: 5432

maintenance database: postgres

username: postgres

senha: postgres

Marque se quiser a opção salvar senha.

Clique em salvar.

Pronto se tudo deu certo você está com o PgAdmin4 e PostgreSQL rodando em contêineres
que você pode pausar com facilidade e não consumir recursos da sua maquina quando 
não estão em uso.

Para interromper os dois contêineres basta fechar a janela do terminal que você rodou
o comando "sudo docker-compose up"

Elementos relevantes que você deve levar em consideração:

Aqui eu não abordei profundamente o uso docker. Tentei ser o mais sintêtico possível.
Uma pessoa que não tenha um conhecimento muito consolidado de docker, mesmo assim, consegue
ter ao final um ambiente para estudo funcional.

Usar o docker dá uma certo trabalho inicial que compensa. Muita gente vem do ambiente windows e
não está muito familiarizado com o uso do terminal para tarefas (Acredite é bem mais rápido executar 
algumas tarefas repetitivas pelo terminal.

Você ao usar conteiner tem umas vantagens como:

Padronização de ambiente: Evita aquela clássica situação de na minha máquina rodou mas não
funciona na máquina do amigo.

Independência do sistema: Eu já utilizei esses mesmos aquivos para criar um amiente numa maquina
rodando Debian 12 e também num ChromeOS ambos funcionaram sem problemas. Instalando o docker no windows
você também poderá rodar sem grandes problemas usando os mesmos arquivos.

Aprendizado de novas ferramentas: Durante esse processo você aprendeu alguma coisa sobre git
docker. Mesmo que básico. Cabe a você buscar um complemento no uso do docker.


Lembre também ! se você já instalou o PsotgreSQL na sua maquina como serviço local você deve liberar 
a porta ou no arquivo docker-compose.yaml redirecionar os serviços para outra porta livre.

Sou apenas um estudante assim como você. Se você encontrou algo que pode ser melhorado nos arquivos 
de configuração contribua também com um commit. Tenho certeza que isso vai deixar muitos colegas estudantes felizes.

Espero que esse tempo dedicado aqui contribua para seus estudos.

Fez besteira acha que alterou algo que não devia (Ainda dá pra corrigir!):

Rode cada um dos comandos abaixo:

sudo docker container prune ( apaga todos os contêineres)
sudo docker volume prune ( apaga todos os volumes)
sudo docker network prune ( apaga todas as redes virtuais)

Apague a pasta que você rodou o git clone

Faça a clonagem do repositório mais uma vez

Rode novamente

sudo docker-compose build

sudo docker-compose up -d

Pronto você voltou tudo para a configuração original.


Lembrando eu adiciono o sudo ao inicio do programa pois não uso conta de administrador. Se você não usa sudo ou adicionou seu usuário ao grupo docker não precisa adicionar o sudo antes de cada comando. Mas leve em consideração a orientação abaixo:

https://wiki.debian.org/Docker
