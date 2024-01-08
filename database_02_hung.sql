--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Homebrew)
-- Dumped by pg_dump version 16.1 (Homebrew)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Customer" (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(255) NOT NULL,
    phone_number numeric(15,0),
    password character varying(50) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."Customer" OWNER TO postgres;

--
-- Name: Customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Customer_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Customer_id_seq" OWNER TO postgres;

--
-- Name: Customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Customer_id_seq" OWNED BY public."Customer".id;


--
-- Name: Order_Details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Order_Details" (
    id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer DEFAULT 0,
    amount integer DEFAULT 0
);


ALTER TABLE public."Order_Details" OWNER TO postgres;

--
-- Name: Order_Details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Order_Details_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Order_Details_id_seq" OWNER TO postgres;

--
-- Name: Order_Details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Order_Details_id_seq" OWNED BY public."Order_Details".id;


--
-- Name: Orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Orders" (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    total_amount integer NOT NULL,
    shipping_fee integer NOT NULL,
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    shipping_id integer NOT NULL
);


ALTER TABLE public."Orders" OWNER TO postgres;

--
-- Name: Orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Orders_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Orders_id_seq" OWNER TO postgres;

--
-- Name: Orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Orders_id_seq" OWNED BY public."Orders".id;


--
-- Name: Product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Product" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    price integer DEFAULT 0,
    inventory integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."Product" OWNER TO postgres;

--
-- Name: Product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Product_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Product_id_seq" OWNER TO postgres;

--
-- Name: Product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Product_id_seq" OWNED BY public."Product".id;


--
-- Name: Customer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Customer" ALTER COLUMN id SET DEFAULT nextval('public."Customer_id_seq"'::regclass);


--
-- Name: Order_Details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order_Details" ALTER COLUMN id SET DEFAULT nextval('public."Order_Details_id_seq"'::regclass);


--
-- Name: Orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders" ALTER COLUMN id SET DEFAULT nextval('public."Orders_id_seq"'::regclass);


--
-- Name: Product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product" ALTER COLUMN id SET DEFAULT nextval('public."Product_id_seq"'::regclass);


--
-- Data for Name: Customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Customer" (id, name, email, phone_number, password, created_at, updated_at) FROM stdin;
1	John Doe	john@example.com	1234567890	password123	2024-01-08 15:17:27.664308	2024-01-08 15:17:27.664308
2	Alice Smith	alice@example.com	9876543210	securepwd	2024-01-08 15:17:27.664308	2024-01-08 15:17:27.664308
3	John Doe	john@example.com	1234567890	password123	2024-01-08 15:21:08.15343	2024-01-08 15:21:08.15343
4	Alice Smith	alice@example.com	9876543210	securepwd	2024-01-08 15:21:08.15343	2024-01-08 15:21:08.15343
5	Ali Yushing	yushing@gmail.com	12331233	213123sas	2024-01-08 15:21:08.15343	2024-01-08 15:21:08.15343
\.


--
-- Data for Name: Order_Details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Order_Details" (id, order_id, product_id, quantity, amount) FROM stdin;
1	1	3	2	300
2	2	5	1	120
\.


--
-- Data for Name: Orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Orders" (id, customer_id, total_amount, shipping_fee, order_date, updated_at, shipping_id) FROM stdin;
1	1	500	20	2024-01-08 15:37:39.795295	2024-01-08 15:37:39.795295	1
2	2	800	30	2024-01-08 15:37:39.795295	2024-01-08 15:37:39.795295	2
\.


--
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Product" (id, name, description, price, inventory, created_at, updated_at) FROM stdin;
1	Product A	Description for Product A	100	50	2024-01-08 15:26:22.655248	2024-01-08 15:26:22.655248
2	Product B	Description for Product B	150	30	2024-01-08 15:26:22.655248	2024-01-08 15:26:22.655248
3	Product C	Description for Product C	200	20	2024-01-08 15:26:22.655248	2024-01-08 15:26:22.655248
4	Product D	Description for Product D	80	70	2024-01-08 15:26:22.655248	2024-01-08 15:26:22.655248
5	Product E	Description for Product E	120	45	2024-01-08 15:26:22.655248	2024-01-08 15:26:22.655248
6	Product F	Description for Product F	300	15	2024-01-08 15:26:22.655248	2024-01-08 15:26:22.655248
7	Product G	Description for Product G	250	25	2024-01-08 15:26:22.655248	2024-01-08 15:26:22.655248
8	Product H	Description for Product H	180	60	2024-01-08 15:26:22.655248	2024-01-08 15:26:22.655248
9	Product I	Description for Product I	90	40	2024-01-08 15:26:22.655248	2024-01-08 15:26:22.655248
10	Product J	Description for Product J	210	35	2024-01-08 15:26:22.655248	2024-01-08 15:26:22.655248
\.


--
-- Name: Customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Customer_id_seq"', 5, true);


--
-- Name: Order_Details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Order_Details_id_seq"', 2, true);


--
-- Name: Orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Orders_id_seq"', 2, true);


--
-- Name: Product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Product_id_seq"', 10, true);


--
-- Name: Customer Customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Customer"
    ADD CONSTRAINT "Customer_pkey" PRIMARY KEY (id);


--
-- Name: Order_Details Order_Details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order_Details"
    ADD CONSTRAINT "Order_Details_pkey" PRIMARY KEY (id);


--
-- Name: Orders Orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_pkey" PRIMARY KEY (id);


--
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (id);


--
-- Name: Order_Details Order_Details_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order_Details"
    ADD CONSTRAINT "Order_Details_order_id_fkey" FOREIGN KEY (order_id) REFERENCES public."Orders"(id);


--
-- Name: Order_Details Order_Details_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order_Details"
    ADD CONSTRAINT "Order_Details_product_id_fkey" FOREIGN KEY (product_id) REFERENCES public."Product"(id);


--
-- Name: Orders Orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES public."Customer"(id);


--
-- PostgreSQL database dump complete
--

