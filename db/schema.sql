--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: bayes_engines; Type: TABLE; Schema: public; Owner: pavel
--

CREATE TABLE bayes_engines (
    id integer NOT NULL,
    name character varying,
    stored_classifier bytea,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id character varying
);


ALTER TABLE bayes_engines OWNER TO pavel;

--
-- Name: bayes_engines_id_seq; Type: SEQUENCE; Schema: public; Owner: pavel
--

CREATE SEQUENCE bayes_engines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bayes_engines_id_seq OWNER TO pavel;

--
-- Name: bayes_engines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pavel
--

ALTER SEQUENCE bayes_engines_id_seq OWNED BY bayes_engines.id;


--
-- Name: block_rules; Type: TABLE; Schema: public; Owner: pavel
--

CREATE TABLE block_rules (
    id integer NOT NULL,
    domain character varying,
    path character varying,
    regex character varying,
    user_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE block_rules OWNER TO pavel;

--
-- Name: block_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: pavel
--

CREATE SEQUENCE block_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE block_rules_id_seq OWNER TO pavel;

--
-- Name: block_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pavel
--

ALTER SEQUENCE block_rules_id_seq OWNED BY block_rules.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: pavel
--

CREATE TABLE events (
    id integer NOT NULL,
    sensor_id character varying,
    event_type integer,
    value integer,
    "time" timestamp without time zone
);


ALTER TABLE events OWNER TO pavel;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: pavel
--

CREATE SEQUENCE items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE items_id_seq OWNER TO pavel;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pavel
--

ALTER SEQUENCE items_id_seq OWNED BY events.id;


--
-- Name: page_stores; Type: TABLE; Schema: public; Owner: pavel
--

CREATE TABLE page_stores (
    id integer NOT NULL,
    url character varying,
    page text,
    raw_page text,
    url_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    key character varying
);


ALTER TABLE page_stores OWNER TO pavel;

--
-- Name: page_stores_id_seq; Type: SEQUENCE; Schema: public; Owner: pavel
--

CREATE SEQUENCE page_stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE page_stores_id_seq OWNER TO pavel;

--
-- Name: page_stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pavel
--

ALTER SEQUENCE page_stores_id_seq OWNED BY page_stores.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: pavel
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO pavel;

--
-- Name: training_actions; Type: TABLE; Schema: public; Owner: pavel
--

CREATE TABLE training_actions (
    id integer NOT NULL,
    url character varying,
    category_id character varying,
    good boolean,
    user_id character varying,
    page text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    training_set_id character varying
);


ALTER TABLE training_actions OWNER TO pavel;

--
-- Name: training_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: pavel
--

CREATE SEQUENCE training_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE training_actions_id_seq OWNER TO pavel;

--
-- Name: training_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pavel
--

ALTER SEQUENCE training_actions_id_seq OWNED BY training_actions.id;


--
-- Name: training_engines; Type: TABLE; Schema: public; Owner: pavel
--

CREATE TABLE training_engines (
    id integer NOT NULL,
    name character varying,
    user_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE training_engines OWNER TO pavel;

--
-- Name: training_engines_id_seq; Type: SEQUENCE; Schema: public; Owner: pavel
--

CREATE SEQUENCE training_engines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE training_engines_id_seq OWNER TO pavel;

--
-- Name: training_engines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pavel
--

ALTER SEQUENCE training_engines_id_seq OWNED BY training_engines.id;


--
-- Name: training_sets; Type: TABLE; Schema: public; Owner: pavel
--

CREATE TABLE training_sets (
    id integer NOT NULL,
    name character varying,
    user_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    training_engine_id character varying
);


ALTER TABLE training_sets OWNER TO pavel;

--
-- Name: training_sets_id_seq; Type: SEQUENCE; Schema: public; Owner: pavel
--

CREATE SEQUENCE training_sets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE training_sets_id_seq OWNER TO pavel;

--
-- Name: training_sets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pavel
--

ALTER SEQUENCE training_sets_id_seq OWNED BY training_sets.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: pavel
--

CREATE TABLE urls (
    id integer NOT NULL,
    url character varying,
    page character varying,
    indexed boolean,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    last_visit_time numeric,
    key character varying,
    norm_url character varying,
    broken boolean,
    robots_blocked boolean
);


ALTER TABLE urls OWNER TO pavel;

--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: pavel
--

CREATE SEQUENCE urls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE urls_id_seq OWNER TO pavel;

--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pavel
--

ALTER SEQUENCE urls_id_seq OWNED BY urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: pavel
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    role integer,
    invitation_token character varying,
    invitation_created_at timestamp without time zone,
    invitation_sent_at timestamp without time zone,
    invitation_accepted_at timestamp without time zone,
    invitation_limit integer,
    invited_by_id integer,
    invited_by_type character varying,
    invitations_count integer DEFAULT 0,
    provider character varying,
    uid character varying
);


ALTER TABLE users OWNER TO pavel;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: pavel
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO pavel;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pavel
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: bayes_engines id; Type: DEFAULT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY bayes_engines ALTER COLUMN id SET DEFAULT nextval('bayes_engines_id_seq'::regclass);


--
-- Name: block_rules id; Type: DEFAULT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY block_rules ALTER COLUMN id SET DEFAULT nextval('block_rules_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('items_id_seq'::regclass);


--
-- Name: page_stores id; Type: DEFAULT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY page_stores ALTER COLUMN id SET DEFAULT nextval('page_stores_id_seq'::regclass);


--
-- Name: training_actions id; Type: DEFAULT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY training_actions ALTER COLUMN id SET DEFAULT nextval('training_actions_id_seq'::regclass);


--
-- Name: training_engines id; Type: DEFAULT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY training_engines ALTER COLUMN id SET DEFAULT nextval('training_engines_id_seq'::regclass);


--
-- Name: training_sets id; Type: DEFAULT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY training_sets ALTER COLUMN id SET DEFAULT nextval('training_sets_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY urls ALTER COLUMN id SET DEFAULT nextval('urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: bayes_engines bayes_engines_pkey; Type: CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY bayes_engines
    ADD CONSTRAINT bayes_engines_pkey PRIMARY KEY (id);


--
-- Name: block_rules block_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY block_rules
    ADD CONSTRAINT block_rules_pkey PRIMARY KEY (id);


--
-- Name: events items_pkey; Type: CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY events
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: page_stores page_stores_pkey; Type: CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY page_stores
    ADD CONSTRAINT page_stores_pkey PRIMARY KEY (id);


--
-- Name: training_actions training_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY training_actions
    ADD CONSTRAINT training_actions_pkey PRIMARY KEY (id);


--
-- Name: training_engines training_engines_pkey; Type: CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY training_engines
    ADD CONSTRAINT training_engines_pkey PRIMARY KEY (id);


--
-- Name: training_sets training_sets_pkey; Type: CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY training_sets
    ADD CONSTRAINT training_sets_pkey PRIMARY KEY (id);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_urls_on_key; Type: INDEX; Schema: public; Owner: pavel
--

CREATE INDEX index_urls_on_key ON urls USING btree (key);


--
-- Name: index_urls_on_last_visit_time; Type: INDEX; Schema: public; Owner: pavel
--

CREATE INDEX index_urls_on_last_visit_time ON urls USING btree (last_visit_time);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: pavel
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_invitation_token; Type: INDEX; Schema: public; Owner: pavel
--

CREATE UNIQUE INDEX index_users_on_invitation_token ON users USING btree (invitation_token);


--
-- Name: index_users_on_invitations_count; Type: INDEX; Schema: public; Owner: pavel
--

CREATE INDEX index_users_on_invitations_count ON users USING btree (invitations_count);


--
-- Name: index_users_on_invited_by_id; Type: INDEX; Schema: public; Owner: pavel
--

CREATE INDEX index_users_on_invited_by_id ON users USING btree (invited_by_id);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: pavel
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: pavel
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

