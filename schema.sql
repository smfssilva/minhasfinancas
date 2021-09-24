
-- DROP DATABASE minhasfinancas;

CREATE DATABASE minhasfinancas;

CREATE SCHEMA financas;

CREATE TABLE financas.usuario
(
  id bigserial NOT NULL PRIMARY KEY,
  nome character varying(150),
  email character varying(100),
  senha character varying(20),
  data_cadastro date default now()
);

CREATE TABLE financas.lancamento
(
  id bigserial NOT NULL PRIMARY KEY ,
  descricao character varying(100) NOT NULL,
  mes integer NOT NULL,
  ano integer NOT NULL,
  valor numeric(16,2),
  tipo character varying(20),
  status character varying(20),
  id_usuario bigint REFERENCES financas.usuario (id),
  data_cadastro date default now(),
  CONSTRAINT lancamento_status_check CHECK (status::text = ANY (ARRAY['PENDENTE'::character varying, 'CANCELADO'::character varying, 'EFETIVADO'::character varying]::text[])),
  CONSTRAINT lancamento_tipo_check CHECK (tipo::text = ANY (ARRAY['RECEITA'::character varying, 'DESPESA'::character varying]::text[]))
);
