# dockerfile para criação ambiente estudo postgresql e pgadmin
# efetua a alteração dos locales do container postgresql.

# aqui eu apenas troco os locales do conteiner do postgresql.

FROM postgres:16.2
RUN localedef -i pt_BR -c -f UTF-8 -A /usr/share/locale/locale.alias pt_BR.UTF-8
ENV LANG pt_BR.utf8
