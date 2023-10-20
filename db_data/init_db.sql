-- -- Database: booking
-- DROP DATABASE IF EXISTS booking;

-- CREATE DATABASE booking
--     WITH
--     OWNER = postgres
--     ENCODING = 'UTF8'
--     LC_COLLATE = 'Russian_Russia.1251'
--     LC_CTYPE = 'Russian_Russia.1251'
--     TABLESPACE = pg_default
--     CONNECTION LIMIT = -1
--     IS_TEMPLATE = False;

-- -- SCHEMA: public

-- DROP SCHEMA IF EXISTS public ;

-- CREATE SCHEMA IF NOT EXISTS public
--     AUTHORIZATION pg_database_owner;

-- COMMENT ON SCHEMA public
--     IS 'standard public schema';

-- GRANT USAGE ON SCHEMA public TO PUBLIC;

-- GRANT ALL ON SCHEMA public TO pg_database_owner;

-- -- Table: public.events

-- DROP TABLE IF EXISTS public.events;

-- CREATE TABLE IF NOT EXISTS public.events
-- (
--     id bigint NOT NULL DEFAULT nextval('events_id_seq'::regclass),
--     name text COLLATE pg_catalog."default",
--     date date,
--     "createdAt" timestamp with time zone NOT NULL,
--     "updatedAt" timestamp with time zone NOT NULL,
--     CONSTRAINT events_pkey PRIMARY KEY (id)
-- )

-- TABLESPACE pg_default;

-- ALTER TABLE IF EXISTS public.events
--     OWNER to postgres;

-- -- Table: public.seats

-- DROP TABLE IF EXISTS public.seats;

-- CREATE TABLE IF NOT EXISTS public.seats
-- (
--     id bigint NOT NULL DEFAULT nextval('seats_id_seq'::regclass),
--     "row" integer,
--     col integer,
--     email character varying(255) COLLATE pg_catalog."default" NOT NULL,
--     "createdAt" timestamp with time zone NOT NULL,
--     "updatedAt" timestamp with time zone NOT NULL,
--     "eventId" bigint,
--     CONSTRAINT seats_pkey PRIMARY KEY (id),
--     CONSTRAINT "seats_eventId_fkey" FOREIGN KEY ("eventId")
--         REFERENCES public.events (id) MATCH SIMPLE
--         ON UPDATE CASCADE
--         ON DELETE CASCADE
-- )

-- TABLESPACE pg_default;

-- ALTER TABLE IF EXISTS public.seats
--     OWNER to postgres;

-- -- Table: public.users

-- DROP TABLE IF EXISTS public.users;

-- CREATE TABLE IF NOT EXISTS public.users
-- (
--     id bigint NOT NULL DEFAULT nextval('users_id_seq'::regclass),
--     firstname character varying(255) COLLATE pg_catalog."default",
--     lastname character varying(255) COLLATE pg_catalog."default",
--     email character varying(255) COLLATE pg_catalog."default" NOT NULL,
--     password character varying(255) COLLATE pg_catalog."default" NOT NULL,
--     CONSTRAINT users_pkey PRIMARY KEY (id),
--     CONSTRAINT users_email_key UNIQUE (email)
-- )

-- TABLESPACE pg_default;

-- ALTER TABLE IF EXISTS public.users
--     OWNER to postgres;