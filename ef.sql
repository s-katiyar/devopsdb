--
-- PostgreSQL database of WW Emission Factors

BEGIN;

SET client_encoding = 'LATIN1';


-- DROP DATABASE IF EXISTS emission_factors;

--
-- Name: emission_factors; Type: DATABASE; Schema: -; Owner: -
--

-- CREATE DATABASE emission_factors;

\connect emission_factors

--
-- Name: factors; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA factors;

--
-- Name: country; Type: TABLE; Schema: factors; Owner: -
--

CREATE TABLE country (
    id integer PRIMARY KEY,
    name text NOT NULL
);

--
-- Name: product; Type: TABLE; Schema: factors; Owner: -
--

CREATE TABLE product (
    id integer PRIMARY KEY,
    name text NOT NULL
);

--
-- Name: ghg; Type: TABLE; Schema: factors; Owner: -
--

CREATE TABLE ghg (
    id integer PRIMARY KEY,
    name text NOT NULL
);

--
-- Name: country_factors; Type: TABLE; Schema: factors; Owner: -
--

CREATE TABLE country_factors (
	id_country integer NOT NULL
	REFERENCES country (id)
	on update cascade on delete cascade,
	id_product integer NOT NULL
	REFERENCES product (id)
	on update cascade on delete cascade,
	id_ghg integer NOT NULL
	REFERENCES ghg (id)
	on update cascade on delete cascade,
	year_recorded integer NOT NULL,
    emission_factor decimal NOT NULL,
	CONSTRAINT country_factors_pkey PRIMARY KEY (id_country, id_product, id_ghg, year_recorded)
);

--
-- Data for Name: country; Type: TABLE DATA; Schema: factors; Owner: -
--

COPY country (id, name) FROM stdin;
1	United States
\.

--
-- Data for Name: product; Type: TABLE DATA; Schema: factors; Owner: -
--

COPY product (id, name) FROM stdin;
1	Total
2	Coal
3	Oil
4	Gas
\.

--
-- Data for Name: ghg; Type: TABLE DATA; Schema: factors; Owner: -
--

COPY ghg (id, name) FROM stdin;
1	CO2
2	CH4
3	N2O
4	CO2e
\.

--
-- Data for Name: country_factors; Type: TABLE DATA; Schema: factors; Owner: -
--

COPY country_factors (id_country, id_product, id_ghg, year_recorded, emission_factor) FROM stdin;
1	1	1	2019	382.4
1	2	1	2019	927.1
1	3	1	2019	656.1
1	4	1	2019	391
1	1	2	2019	0.2
1	2	2	2019	0.2
1	3	2	2019	0.6
1	4	2	2019	0.2
1	1	3	2019	1.3
1	2	3	2019	4.3
1	3	3	2019	1.3
1	4	3	2019	0.2
1	1	4	2019	383.9
1	2	4	2019	931.6
1	3	4	2019	658
1	4	4	2019	391.4
1	1	1	2020	350.4
1	2	1	2020	927.7
1	3	1	2020	678.5
1	4	1	2020	391
1	1	2	2020	0.1
1	2	2	2020	0.2
1	3	2	2020	0.6
1	4	2	2020	0.2
1	1	3	2020	1
1	2	3	2020	4.3
1	3	3	2020	1.4
1	4	3	2020	0.2
1	1	4	2020	351.5
1	2	4	2020	932.2
1	3	4	2020	680.5
1	4	4	2020	391.4
\.

COMMIT;

ANALYZE country;
ANALYZE product;
ANALYZE ghg;
ANALYZE country_factors;
