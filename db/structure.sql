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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
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
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


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
-- Name: ingredients fk_rails_38d2fbcefc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT fk_rails_38d2fbcefc FOREIGN KEY (effect_id) REFERENCES public.effects(id);


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
('20200829110658');


