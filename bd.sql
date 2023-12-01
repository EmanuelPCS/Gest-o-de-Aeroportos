/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     12/11/2022 2:08:37 PM                        */
/*==============================================================*/


alter table AVIOES
   drop constraint FK_AVIOES_TEM_COMPANHI;

alter table COMPRAM
   drop constraint FK_COMPRAM_RELATIONS_PASSAGEI;

alter table COMPRAM
   drop constraint FK_COMPRAM_RELATIONS_VOOS;

alter table CONTROLAM
   drop constraint FK_CONTROLA_REFERENCE_AEROPORT;

alter table CONTROLAM
   drop constraint FK_CONTROLA_RELATIONS_VOOS;

alter table EFECTUAM
   drop constraint FK_EFECTUAM_EFECTUAM_VOOS;

alter table EFECTUAM
   drop constraint FK_EFECTUAM_EFECTUAM2_AVIOES;

alter table ESTACIONOU
   drop constraint FK_ESTACION_RELATIONS_PESSOAS;

alter table ESTACIONOU
   drop constraint FK_ESTACION_RELATIONS_PARQUESE;

alter table FUNCIONARIOS
   drop constraint FK_FUNCIONA_EMPREGAM_AEROPORT;

alter table FUNCIONARIOS
   drop constraint FK_FUNCIONA_HERANCA2_PESSOAS;

alter table OPERAM
   drop constraint FK_OPERAM_OPERAM_COMPANHI;

alter table OPERAM
   drop constraint FK_OPERAM_OPERAM2_AEROPORT;

alter table PARQUESESTACIONAMENTOPRIVADO
   drop constraint FK_PARQUESE_DISPOEM_AEROPORT;

alter table PASSAGEIROS
   drop constraint FK_PASSAGEI_HERANCA_PESSOAS;

drop table AEROPORTOS cascade constraints;

drop index TEM_FK;

drop table AVIOES cascade constraints;

drop table COMPANHIASAEREAS cascade constraints;

drop index RELATIONSHIP_17_FK;

drop index RELATIONSHIP_16_FK;

drop table COMPRAM cascade constraints;

drop index RELATIONSHIP_13_FK;

drop table CONTROLAM cascade constraints;

drop index EFECTUAM2_FK;

drop index EFECTUAM_FK;

drop table EFECTUAM cascade constraints;

drop index RELATIONSHIP_15_FK;

drop index RELATIONSHIP_14_FK;

drop table ESTACIONOU cascade constraints;

drop index HERANCA2_FK;

drop table FUNCIONARIOS cascade constraints;

drop index OPERAM2_FK;

drop index OPERAM_FK;

drop table OPERAM cascade constraints;

drop index DISPOEM_FK;

drop table PARQUESESTACIONAMENTOPRIVADO cascade constraints;

drop index HERANCA_FK;

drop table PASSAGEIROS cascade constraints;

drop table PESSOAS cascade constraints;

drop table VOOS cascade constraints;

/*==============================================================*/
/* Table: AEROPORTOS                                            */
/*==============================================================*/
create table AEROPORTOS 
(
   IDAEROPORTO          INTEGER              not null,
   CODIGOPOSTAL         VARCHAR2(12)         not null,
   CIDADE               VARCHAR2(40)         not null,
   RUA                  VARCHAR2(128)        not null,
   NUMERO               INTEGER              not null,
   NOME                 VARCHAR2(40)         not null,
   NUMSETORES           INTEGER              not null,
   NUMFUNCIONARIOSPOSTO INTEGER,
   TIPOFUNCIONAMENTO    VARCHAR2(30)         not null,
   LOCALIZACAO          CLOB                 not null,
   IDTORRECONTROLO      INTEGER              not null,
   constraint PK_AEROPORTOS primary key (IDAEROPORTO, IDTORRECONTROLO)
);

/*==============================================================*/
/* Table: AVIOES                                                */
/*==============================================================*/
create table AVIOES 
(
   IDAVIAO              INTEGER              not null,
   IDCOMPANHIA          INTEGER,
   NOME                 VARCHAR2(40)         not null,
   TIPOAVIAO            VARCHAR2(50)         not null,
   NUMLUGARES           INTEGER              not null,
   constraint PK_AVIOES primary key (IDAVIAO)
);

/*==============================================================*/
/* Index: TEM_FK                                                */
/*==============================================================*/
create index TEM_FK on AVIOES (
   IDCOMPANHIA ASC
);

/*==============================================================*/
/* Table: COMPANHIASAEREAS                                      */
/*==============================================================*/
create table COMPANHIASAEREAS 
(
   IDCOMPANHIA          INTEGER              not null,
   NOME                 VARCHAR2(40)         not null,
   LOCALIZACAODASEDEPRINCIPAL CLOB                 not null,
   CONTRATO             CLOB                 not null,
   SIGLA                VARCHAR2(7),
   constraint PK_COMPANHIASAEREAS primary key (IDCOMPANHIA)
);

/*==============================================================*/
/* Table: COMPRAM                                               */
/*==============================================================*/
create table COMPRAM 
(
   IDPASSAGEIRO         INTEGER              not null,
   IDVOO                INTEGER              not null,
   TIPOBILHETE          VARCHAR2(30)         not null,
   LUGARPASSAGEIRO      VARCHAR2(5)          not null,
   VALIDADEBILHETE      DATE                 not null,
   CODIGOBARRASBILHETE  CLOB                 not null,
   TIPOCOMPRA           VARCHAR2(30)         not null,
   TIPOPAGAMENTO        VARCHAR2(100)        not null,
   NOMEFATURA           VARCHAR2(30)         not null,
   MALAPORAO            NUMBER,
   DATAEMISSAOBILHETECOMPRADO DATE                 not null,
   DATAVOODOBILHETECOMPRADO DATE                 not null,
   CANCELADO            SMALLINT             not null,
   VERIFICACAOENTRADAAVIAO SMALLINT             not null,
   constraint PK_COMPRAM primary key (IDPASSAGEIRO, IDVOO)
);

/*==============================================================*/
/* Index: RELATIONSHIP_16_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_16_FK on COMPRAM (
   IDVOO ASC,
   IDPASSAGEIRO ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_17_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_17_FK on COMPRAM (
   IDVOO ASC
);

/*==============================================================*/
/* Table: CONTROLAM                                             */
/*==============================================================*/
create table CONTROLAM 
(
   IDTORRECONTROLO      INTEGER              not null,
   IDVOO                INTEGER              not null,
   HORAPARTIDAALTERADA  DATE,
   HORACHEGADAALTERADA  DATE,
   PORTAEMBARQUEALTERADA VARCHAR2(5),
   LUGARAVIAOESTACIONADO VARCHAR2(20),
   constraint PK_CONTROLAM primary key (IDTORRECONTROLO, IDVOO)
);

/*==============================================================*/
/* Index: RELATIONSHIP_13_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_13_FK on CONTROLAM (
   IDVOO ASC
);

/*==============================================================*/
/* Table: EFECTUAM                                              */
/*==============================================================*/
create table EFECTUAM 
(
   IDVOO                INTEGER              not null,
   IDAVIAO              INTEGER              not null,
   constraint PK_EFECTUAM primary key (IDVOO, IDAVIAO)
);

/*==============================================================*/
/* Index: EFECTUAM_FK                                           */
/*==============================================================*/
create index EFECTUAM_FK on EFECTUAM (
   IDVOO ASC
);

/*==============================================================*/
/* Index: EFECTUAM2_FK                                          */
/*==============================================================*/
create index EFECTUAM2_FK on EFECTUAM (
   IDAVIAO ASC
);

/*==============================================================*/
/* Table: ESTACIONOU                                            */
/*==============================================================*/
create table ESTACIONOU 
(
   IDPESSOA             INTEGER              not null,
   IDPARQUEESTACIONAMENTO INTEGER              not null,
   HORAENTRADAPARQUE    DATE,
   HORASAIDAPARQUE      DATE,
   VALORPAGO            FLOAT,
   TIPOPAGAMENTO        VARCHAR2(100),
   constraint PK_ESTACIONOU primary key (IDPESSOA, IDPARQUEESTACIONAMENTO)
);

/*==============================================================*/
/* Index: RELATIONSHIP_14_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_14_FK on ESTACIONOU (
   IDPESSOA ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_15_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_15_FK on ESTACIONOU (
   IDPARQUEESTACIONAMENTO ASC
);

/*==============================================================*/
/* Table: FUNCIONARIOS                                          */
/*==============================================================*/
create table FUNCIONARIOS 
(
   IDPESSOA             INTEGER              not null,
   IDFUNCIONARIO        INTEGER              not null,
   IDAEROPORTO          INTEGER,
   CONTRATO             CLOB                 not null,
   FUNCAO               VARCHAR2(50),
   constraint PK_FUNCIONARIOS primary key (IDPESSOA, IDFUNCIONARIO)
);

/*==============================================================*/
/* Index: HERANCA2_FK                                           */
/*==============================================================*/
create index HERANCA2_FK on FUNCIONARIOS (
   IDPESSOA ASC
);

/*==============================================================*/
/* Table: OPERAM                                                */
/*==============================================================*/
create table OPERAM 
(
   IDCOMPANHIA          INTEGER              not null,
   IDAEROPORTO          INTEGER              not null,
   constraint PK_OPERAM primary key (IDCOMPANHIA, IDAEROPORTO)
);

/*==============================================================*/
/* Index: OPERAM_FK                                             */
/*==============================================================*/
create index OPERAM_FK on OPERAM (
   IDCOMPANHIA ASC
);

/*==============================================================*/
/* Index: OPERAM2_FK                                            */
/*==============================================================*/
create index OPERAM2_FK on OPERAM (
   IDAEROPORTO ASC,
   IDCOMPANHIA ASC
);

/*==============================================================*/
/* Table: PARQUESESTACIONAMENTOPRIVADO                          */
/*==============================================================*/
create table PARQUESESTACIONAMENTOPRIVADO 
(
   IDPARQUEESTACIONAMENTO INTEGER              not null,
   IDAEROPORTO          INTEGER,
   NUMLUGARES           INTEGER              not null,
   TIPOPARQUEESTACIONAMENTO VARCHAR2(20)         not null,
   HORARIO              VARCHAR2(40),
   PRECOPORHORA         INTEGER              not null,
   TEMPOIRAPEATEAOAEROPORTO INTEGER              not null,
   LOCALIZACAO          CLOB                 not null,
   constraint PK_PARQUESESTACIONAMENTOPRIVAD primary key (IDPARQUEESTACIONAMENTO)
);

/*==============================================================*/
/* Index: DISPOEM_FK                                            */
/*==============================================================*/
create index DISPOEM_FK on PARQUESESTACIONAMENTOPRIVADO (
   IDAEROPORTO ASC,
   IDPARQUEESTACIONAMENTO ASC
);

/*==============================================================*/
/* Table: PASSAGEIROS                                           */
/*==============================================================*/
create table PASSAGEIROS 
(
   IDPESSOA             INTEGER              not null,
   IDPASSAGEIRO         INTEGER              not null,
   PATOLOGIAS           VARCHAR2(50),
   constraint PK_PASSAGEIROS primary key (IDPESSOA, IDPASSAGEIRO)
);

/*==============================================================*/
/* Index: HERANCA_FK                                            */
/*==============================================================*/
create index HERANCA_FK on PASSAGEIROS (
   IDPESSOA ASC
);

/*==============================================================*/
/* Table: PESSOAS                                               */
/*==============================================================*/
create table PESSOAS 
(
   IDPESSOA             INTEGER              not null,
   NOMEPROPRIO          VARCHAR2(40)         not null,
   APELIDO              VARCHAR2(40),
   NIF                  INTEGER              not null,
   CODIGOPOSTAL         VARCHAR2(12)         not null,
   CIDADE               VARCHAR2(40)         not null,
   RUA                  VARCHAR2(128),
   NUMERO               INTEGER,
   TELEFONE             INTEGER,
   DATANASCIMENTO       DATE                 not null,
   CARTAOCIDADAO        VARCHAR2(12),
   PASSAPORTE           VARCHAR2(10),
   EMAIL                VARCHAR2(100),
   constraint PK_PESSOAS primary key (IDPESSOA)
);

/*==============================================================*/
/* Table: VOOS                                                  */
/*==============================================================*/
create table VOOS 
(
   IDVOO                INTEGER              not null,
   NUMVOO               VARCHAR2(35)         not null,
   PRECOVOOBASE         INTEGER              not null,
   DATASEMANA           DATE                 not null,
   NUMTERMINAL          INTEGER              not null,
   PORTAEMBARQUE        VARCHAR2(5)          not null,
   HORACHEGADA          DATE                 not null,
   HORAPARTIDA          DATE                 not null,
   ORIGEM               VARCHAR2(50)         not null,
   DESTINO              VARCHAR2(50)         not null,
   ESCALA               INTEGER              not null,
   LOCALESCALA          VARCHAR2(50),
   constraint PK_VOOS primary key (IDVOO)
);

alter table AVIOES
   add constraint FK_AVIOES_TEM_COMPANHI foreign key (IDCOMPANHIA)
      references COMPANHIASAEREAS (IDCOMPANHIA);

alter table COMPRAM
   add constraint FK_COMPRAM_RELATIONS_PASSAGEI foreign key (IDVOO, IDPASSAGEIRO)
      references PASSAGEIROS (IDPESSOA, IDPASSAGEIRO);

alter table COMPRAM
   add constraint FK_COMPRAM_RELATIONS_VOOS foreign key (IDVOO)
      references VOOS (IDVOO);

alter table CONTROLAM
   add constraint FK_CONTROLA_REFERENCE_AEROPORT foreign key (IDVOO, IDTORRECONTROLO)
      references AEROPORTOS (IDAEROPORTO, IDTORRECONTROLO);

alter table CONTROLAM
   add constraint FK_CONTROLA_RELATIONS_VOOS foreign key (IDVOO)
      references VOOS (IDVOO);

alter table EFECTUAM
   add constraint FK_EFECTUAM_EFECTUAM_VOOS foreign key (IDVOO)
      references VOOS (IDVOO);

alter table EFECTUAM
   add constraint FK_EFECTUAM_EFECTUAM2_AVIOES foreign key (IDAVIAO)
      references AVIOES (IDAVIAO);

alter table ESTACIONOU
   add constraint FK_ESTACION_RELATIONS_PESSOAS foreign key (IDPESSOA)
      references PESSOAS (IDPESSOA);

alter table ESTACIONOU
   add constraint FK_ESTACION_RELATIONS_PARQUESE foreign key (IDPARQUEESTACIONAMENTO)
      references PARQUESESTACIONAMENTOPRIVADO (IDPARQUEESTACIONAMENTO);

alter table FUNCIONARIOS
   add constraint FK_FUNCIONA_EMPREGAM_AEROPORT foreign key (IDAEROPORTO, IDFUNCIONARIO)
      references AEROPORTOS (IDAEROPORTO, IDTORRECONTROLO);

alter table FUNCIONARIOS
   add constraint FK_FUNCIONA_HERANCA2_PESSOAS foreign key (IDPESSOA)
      references PESSOAS (IDPESSOA);

alter table OPERAM
   add constraint FK_OPERAM_OPERAM_COMPANHI foreign key (IDCOMPANHIA)
      references COMPANHIASAEREAS (IDCOMPANHIA);

alter table OPERAM
   add constraint FK_OPERAM_OPERAM2_AEROPORT foreign key (IDAEROPORTO, IDCOMPANHIA)
      references AEROPORTOS (IDAEROPORTO, IDTORRECONTROLO);

alter table PARQUESESTACIONAMENTOPRIVADO
   add constraint FK_PARQUESE_DISPOEM_AEROPORT foreign key (IDAEROPORTO, IDPARQUEESTACIONAMENTO)
      references AEROPORTOS (IDAEROPORTO, IDTORRECONTROLO);

alter table PASSAGEIROS
   add constraint FK_PASSAGEI_HERANCA_PESSOAS foreign key (IDPESSOA)
      references PESSOAS (IDPESSOA);

