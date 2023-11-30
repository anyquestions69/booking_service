-- Table: public.balcons

-- DROP TABLE IF EXISTS public.balcons;

CREATE TABLE IF NOT EXISTS public.balcons
(
    id bigint NOT NULL DEFAULT nextval('balcons_id_seq'::regclass),
    "row" integer,
    col integer,
    email character varying(255) COLLATE pg_catalog."default",
    price double precision,
    active boolean,
    uuid character varying(255) COLLATE pg_catalog."default",
    qr text COLLATE pg_catalog."default",
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "eventId" bigint,
    "sectorId" integer,
    "statusId" integer,
    CONSTRAINT balcons_pkey PRIMARY KEY (id),
    CONSTRAINT "balcons_eventId_fkey" FOREIGN KEY ("eventId")
        REFERENCES public.events (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT "balcons_sectorId_fkey" FOREIGN KEY ("sectorId")
        REFERENCES public.sectors (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT "balcons_statusId_fkey" FOREIGN KEY ("statusId")
        REFERENCES public.statuses (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.balcons
    OWNER to postgres;