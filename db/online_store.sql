-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.1-beta
-- PostgreSQL version: 10.0
-- Project Site: pgmodeler.com.br
-- Model Author: ---

-- object: nymo | type: ROLE --
-- DROP ROLE IF EXISTS nymo;
CREATE ROLE nymo WITH 
	SUPERUSER
	CREATEDB
	CREATEROLE
	INHERIT
	LOGIN
	ENCRYPTED PASSWORD '********';
-- ddl-end --


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: umn_discount_shopping | type: DATABASE --
-- -- DROP DATABASE IF EXISTS umn_discount_shopping;
-- CREATE DATABASE umn_discount_shopping
-- 	ENCODING = 'UTF8'
-- 	LC_COLLATE = 'en_US.UTF-8'
-- 	LC_CTYPE = 'en_US.UTF-8'
-- 	TABLESPACE = pg_default
-- 	OWNER = postgres
-- ;
-- -- ddl-end --
-- 

-- object: public.hibernate_sequence | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.hibernate_sequence CASCADE;
CREATE SEQUENCE public.hibernate_sequence
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.hibernate_sequence OWNER TO postgres;
-- ddl-end --

-- object: public.customer | type: TABLE --
-- DROP TABLE IF EXISTS public.customer CASCADE;
CREATE TABLE public.customer(
	id bigint NOT NULL,
	version bigint NOT NULL,
	first_name character varying(255) NOT NULL,
	middle_name character varying(255),
	password character varying(255) NOT NULL,
	last_name character varying(255) NOT NULL,
	email character varying(255) NOT NULL,
	CONSTRAINT customer_pkey PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.customer OWNER TO postgres;
-- ddl-end --

-- object: public.discount | type: TABLE --
-- DROP TABLE IF EXISTS public.discount CASCADE;
CREATE TABLE public.discount(
	id bigint NOT NULL,
	version bigint NOT NULL,
	name character varying(255) NOT NULL,
	item_count integer,
	type_id bigint NOT NULL,
	percent integer,
	amount integer,
	description character varying(255),
	CONSTRAINT discount_pkey PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.discount OWNER TO postgres;
-- ddl-end --

-- object: public.discount_type | type: TABLE --
-- DROP TABLE IF EXISTS public.discount_type CASCADE;
CREATE TABLE public.discount_type(
	id bigint NOT NULL,
	version bigint NOT NULL,
	scope character varying(255) NOT NULL,
	name character varying(255) NOT NULL,
	description character varying(255),
	CONSTRAINT discount_type_pkey PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.discount_type OWNER TO postgres;
-- ddl-end --

-- object: public.full_order | type: TABLE --
-- DROP TABLE IF EXISTS public.full_order CASCADE;
CREATE TABLE public.full_order(
	id bigint NOT NULL,
	version bigint NOT NULL,
	created timestamp NOT NULL,
	total_cost real NOT NULL,
	CONSTRAINT full_order_pkey PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.full_order OWNER TO postgres;
-- ddl-end --

-- object: public.item | type: TABLE --
-- DROP TABLE IF EXISTS public.item CASCADE;
CREATE TABLE public.item(
	id bigint NOT NULL,
	version bigint NOT NULL,
	name character varying(255) NOT NULL,
	cost real NOT NULL,
	description character varying(255),
	sku character varying(255) NOT NULL,
	CONSTRAINT item_pkey PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.item OWNER TO postgres;
-- ddl-end --

-- object: public.order_discount | type: TABLE --
-- DROP TABLE IF EXISTS public.order_discount CASCADE;
CREATE TABLE public.order_discount(
	id bigint NOT NULL,
	version bigint NOT NULL,
	item_id bigint,
	value integer NOT NULL,
	discount_id bigint NOT NULL,
	order_id bigint NOT NULL,
	CONSTRAINT order_discount_pkey PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.order_discount OWNER TO postgres;
-- ddl-end --

-- object: public.order_history | type: TABLE --
-- DROP TABLE IF EXISTS public.order_history CASCADE;
CREATE TABLE public.order_history(
	id bigint NOT NULL,
	version bigint NOT NULL,
	customer_id bigint NOT NULL,
	order_id bigint NOT NULL,
	CONSTRAINT order_history_pkey PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.order_history OWNER TO postgres;
-- ddl-end --

-- object: public.order_item_list | type: TABLE --
-- DROP TABLE IF EXISTS public.order_item_list CASCADE;
CREATE TABLE public.order_item_list(
	id bigint NOT NULL,
	version bigint NOT NULL,
	item_id bigint NOT NULL,
	quantity integer NOT NULL,
	calculated_cost real NOT NULL,
	order_id bigint NOT NULL,
	CONSTRAINT order_item_list_pkey PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.order_item_list OWNER TO postgres;
-- ddl-end --

-- object: fkriwnatjeqtevfv6v3dw0mflwo | type: CONSTRAINT --
-- ALTER TABLE public.discount DROP CONSTRAINT IF EXISTS fkriwnatjeqtevfv6v3dw0mflwo CASCADE;
ALTER TABLE public.discount ADD CONSTRAINT fkriwnatjeqtevfv6v3dw0mflwo FOREIGN KEY (type_id)
REFERENCES public.discount_type (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fkleywhsomhil7npgskf7j7sfoj | type: CONSTRAINT --
-- ALTER TABLE public.order_discount DROP CONSTRAINT IF EXISTS fkleywhsomhil7npgskf7j7sfoj CASCADE;
ALTER TABLE public.order_discount ADD CONSTRAINT fkleywhsomhil7npgskf7j7sfoj FOREIGN KEY (item_id)
REFERENCES public.item (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fkc8k78pwub3wbsnsgb0ccqdrw8 | type: CONSTRAINT --
-- ALTER TABLE public.order_discount DROP CONSTRAINT IF EXISTS fkc8k78pwub3wbsnsgb0ccqdrw8 CASCADE;
ALTER TABLE public.order_discount ADD CONSTRAINT fkc8k78pwub3wbsnsgb0ccqdrw8 FOREIGN KEY (discount_id)
REFERENCES public.discount (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fktrfktj08u9mk0629lr6sbqc7i | type: CONSTRAINT --
-- ALTER TABLE public.order_discount DROP CONSTRAINT IF EXISTS fktrfktj08u9mk0629lr6sbqc7i CASCADE;
ALTER TABLE public.order_discount ADD CONSTRAINT fktrfktj08u9mk0629lr6sbqc7i FOREIGN KEY (order_id)
REFERENCES public.full_order (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fkj7nwdjdh5ipolmlcaso4oygd4 | type: CONSTRAINT --
-- ALTER TABLE public.order_history DROP CONSTRAINT IF EXISTS fkj7nwdjdh5ipolmlcaso4oygd4 CASCADE;
ALTER TABLE public.order_history ADD CONSTRAINT fkj7nwdjdh5ipolmlcaso4oygd4 FOREIGN KEY (customer_id)
REFERENCES public.customer (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk2f087bc9ka7evdq9isunm5sd6 | type: CONSTRAINT --
-- ALTER TABLE public.order_history DROP CONSTRAINT IF EXISTS fk2f087bc9ka7evdq9isunm5sd6 CASCADE;
ALTER TABLE public.order_history ADD CONSTRAINT fk2f087bc9ka7evdq9isunm5sd6 FOREIGN KEY (order_id)
REFERENCES public.full_order (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk88pw9129yxjeq0j4pc9inl2ju | type: CONSTRAINT --
-- ALTER TABLE public.order_item_list DROP CONSTRAINT IF EXISTS fk88pw9129yxjeq0j4pc9inl2ju CASCADE;
ALTER TABLE public.order_item_list ADD CONSTRAINT fk88pw9129yxjeq0j4pc9inl2ju FOREIGN KEY (item_id)
REFERENCES public.item (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fkalroy739trhurr1c1kmd4n573 | type: CONSTRAINT --
-- ALTER TABLE public.order_item_list DROP CONSTRAINT IF EXISTS fkalroy739trhurr1c1kmd4n573 CASCADE;
ALTER TABLE public.order_item_list ADD CONSTRAINT fkalroy739trhurr1c1kmd4n573 FOREIGN KEY (order_id)
REFERENCES public.full_order (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


