<h1 align=center>Ambiente PostgreSQL PgAdmin</h1>

<b>Ambiente básico para estudo PgAdmin4 v8.4  e PostgreSQL v16.2</b>

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

```bash
$ sudo apt install git docker.io docker-compose
```

Com o git instalado basta clonar este repositório com:

```bash
git clone https://github.com/souza-lb/estudo-pgadmin-postgresql.git
```

Dentro da pasta do repositório que acabou de clonar execute:

```bash
sudo docker-compose build
```

Isso vai damorar um pouco na primera vez pois vai baixar as imagens para o repositório local.

após finalizar rode para subir os contêineres:

```bash
$ sudo docker-compose up
```

Você também pode rodar o comando acima com o parâmetro -d como resultado seu terminal fica livre

```bash
$ sudo docker-compose up -d
```

Para interromper todos os contêineres rodando use:

```bash
$ sudo docker stop $(sudo docker ps -aq)
```

Não feche a janela do terminal apenas minimize. 
Em seguida abra o navegador e acesse: localhost:80.
Se você seguiu todos os passos até aqui você terá a tela de login do PgAdmin4 no seu navegador e seu banco rodando.

Agora falta configurar os dados de login do PgAdmin

Lembrando que para logar na tela inicial do pgadmin você usa os dados abaixo:

``
Username/Email Adress: admin@admin.com
senha: postgres
``

Apos iniciar use a opção adicionar novo servidor e use os dados abaixo:

<b>Na aba General:</b>

``nome: postgres``

<b>Na aba Conexão:</b>

``host: postgresql-16.2``

``port: 5432``

``maintenance database: postgres``

``username: postgres``

``senha: postgres``

<b>Marque se quiser a opção salvar senha.</b>

<b>Clique em salvar.</b>

<b>Pronto se tudo deu certo você está com o PgAdmin4 e PostgreSQL rodando em contêineres
que você pode pausar com facilidade e não consumir recursos da sua maquina quando 
não estão em uso.</b>

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


Lembre também ! se você já instalou o PostgreSQL na sua máquina como serviço local anteriormente você deve liberar 
a porta ou no arquivo docker-compose.yaml redirecionar os serviços para outra porta livre.

Espero que esse tempo dedicado aqui contribua para seus estudos.

<b>Fez besteira acha que alterou algo que não devia (Ainda dá pra corrigir!):</b>

Rode cada um dos comandos abaixo no terminal:

```bash
$ sudo docker container prune
```
<b>( apaga todos os contêineres)</b>

```bash
$ sudo docker volume prune
```
<b>( apaga todos os volumes)</b>

```bash
$ sudo docker network prune
```
<b>( apaga todas as redes virtuais)</b>


<b>Apague a pasta que você rodou o git clone


Faça a clonagem do repositório mais uma vez

Rode novamente</b>

```bash
$ sudo docker-compose build
```

```bash
$ sudo docker-compose up -d
```

<b>Pronto você voltou tudo para a configuração original.</b>


Lembrando eu adiciono o sudo ao inicio de cada comando pois não uso conta de administrador. Se você não usa sudo ou adicionou seu usuário ao grupo docker não precisa adicionar o sudo antes de cada comando. Mas leve em consideração a orientação em: https://wiki.debian.org/Docker
Para minimizar o consumo de recursos quando fora de uso e evitar o reinicio automatico dos contêineres
no reboot da máquina, o arquivo docker-compose.yml foi alterado para "restart: on-failure", se você acha conveniente
os contêineres já carregarem após o reboot pode optar por manter a opção "restart: aways" como anteriormente.


Este tutorial foi elaborado por <b>Leonardo Bruno</b><p>
Seu uso e reprodução é livre com a referência ao repositório original.<p>
Encontrou algum erro? Quer sugerir alguma alteração?<p>
<b>202301011744@alunos.estacio.br</b>

