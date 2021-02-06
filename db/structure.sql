SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: dish_category; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.dish_category AS ENUM (
    'rock_hard_food',
    'dubious_food',
    'elixir',
    'food'
);


--
-- Name: effect_outcome; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.effect_outcome AS ENUM (
    'buff',
    'additive',
    'restorative'
);


--
-- Name: ingredient_category; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.ingredient_category AS ENUM (
    'food',
    'seasoning',
    'critter',
    'monster_part',
    'dragon_part',
    'ore',
    'special'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: dish_recipes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dish_recipes (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    dish_id uuid NOT NULL,
    recipe_id uuid NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: dishes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dishes (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    hearts numeric(4,2) DEFAULT 0.0,
    value integer DEFAULT 0,
    effect_id uuid,
    effect_potency numeric(4,2),
    duration integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    equivalence_key text,
    category public.dish_category
);


--
-- Name: effects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.effects (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    name text NOT NULL,
    detail text NOT NULL,
    time_per_ingredient integer,
    potency_thresholds numeric(4,2)[] NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    outcome public.effect_outcome
);


--
-- Name: ingredients; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ingredients (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    name text NOT NULL,
    value integer DEFAULT 0,
    base_hearts numeric(4,2) DEFAULT 0.0,
    effect_id uuid,
    effect_potency numeric(4,2),
    time_bonus integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    category public.ingredient_category
);


--
-- Name: recipe_ingredients; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.recipe_ingredients (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    recipe_id uuid NOT NULL,
    ingredient_id uuid NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: recipes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.recipes (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    ingredients_key text NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: dish_recipes dish_recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dish_recipes
    ADD CONSTRAINT dish_recipes_pkey PRIMARY KEY (id);


--
-- Name: dishes dishes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT dishes_pkey PRIMARY KEY (id);


--
-- Name: effects effects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.effects
    ADD CONSTRAINT effects_pkey PRIMARY KEY (id);


--
-- Name: ingredients ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);


--
-- Name: recipe_ingredients recipe_ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recipe_ingredients
    ADD CONSTRAINT recipe_ingredients_pkey PRIMARY KEY (id);


--
-- Name: recipes recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_dish_recipes_on_dish_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_dish_recipes_on_dish_id ON public.dish_recipes USING btree (dish_id);


--
-- Name: index_dish_recipes_on_recipe_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_dish_recipes_on_recipe_id ON public.dish_recipes USING btree (recipe_id);


--
-- Name: index_dishes_on_effect_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_dishes_on_effect_id ON public.dishes USING btree (effect_id);


--
-- Name: index_dishes_on_equivalence_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_dishes_on_equivalence_key ON public.dishes USING btree (equivalence_key);


--
-- Name: index_ingredients_on_effect_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ingredients_on_effect_id ON public.ingredients USING btree (effect_id);


--
-- Name: index_recipe_ingredients_on_ingredient_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_recipe_ingredients_on_ingredient_id ON public.recipe_ingredients USING btree (ingredient_id);


--
-- Name: index_recipe_ingredients_on_recipe_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_recipe_ingredients_on_recipe_id ON public.recipe_ingredients USING btree (recipe_id);


--
-- Name: index_recipes_on_ingredients_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_recipes_on_ingredients_key ON public.recipes USING btree (ingredients_key);


--
-- Name: dishes fk_rails_08c1ec3d6e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT fk_rails_08c1ec3d6e FOREIGN KEY (effect_id) REFERENCES public.effects(id);


--
-- Name: recipe_ingredients fk_rails_176a228c1e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recipe_ingredients
    ADD CONSTRAINT fk_rails_176a228c1e FOREIGN KEY (recipe_id) REFERENCES public.recipes(id);


--
-- Name: recipe_ingredients fk_rails_209d9afca6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recipe_ingredients
    ADD CONSTRAINT fk_rails_209d9afca6 FOREIGN KEY (ingredient_id) REFERENCES public.ingredients(id);


--
-- Name: dish_recipes fk_rails_2a5343cb13; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dish_recipes
    ADD CONSTRAINT fk_rails_2a5343cb13 FOREIGN KEY (dish_id) REFERENCES public.dishes(id);


--
-- Name: ingredients fk_rails_38d2fbcefc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT fk_rails_38d2fbcefc FOREIGN KEY (effect_id) REFERENCES public.effects(id);


--
-- Name: dish_recipes fk_rails_bba56b8ed1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dish_recipes
    ADD CONSTRAINT fk_rails_bba56b8ed1 FOREIGN KEY (recipe_id) REFERENCES public.recipes(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20200808125025'),
('20200808125346'),
('20200808130112'),
('20200809012011'),
('20200809012349'),
('20200828023831'),
('20200829110658'),
('20200925232259'),
('20200926055720'),
('20200926072857'),
('20200926073148'),
('20210205105448');


