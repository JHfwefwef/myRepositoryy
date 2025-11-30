CREATE TABLE public."users"
(
	id BIGINT PRIMARY KEY NOT NULL ,
	username VARCHAR(255) NOT NULL,
	password VARCHAR(255) NOT NULL,
    role VARCHAR NOT NULL,
	UNIQUE(username)
);

ALTER TABLE IF EXISTS public."users"
    OWNER to postgres;

CREATE TABLE public.process_parameters
(
    id BIGINT PRIMARY KEY NOT NULL,
    user_id BIGINT NOT NULL,
    material_id BIGINT NOT NULL,
    time_min int NOT NULL,
    time_max int NOT NULL,
    time_step int NOT NULL,
    temp_min int NOT NULL,
    temp_max int NOT NULL,
    temp_step int NOT NULL,
    FOREIGN KEY (user_id) REFERENCES "users" (id) ON DELETE CASCADE,
    FOREIGN KEY (material_id) REFERENCES material (id) ON DELETE CASCADE
);

ALTER TABLE IF EXISTS public.process_parameters
    OWNER to postgres;

CREATE TABLE public.material
(
    id BIGINT PRIMARY KEY NOT NULL,
    name VARCHAR NOT NULL
);

ALTER TABLE IF EXISTS public.material
    OWNER to postgres;

CREATE TABLE public.math_model
(
    id BIGINT PRIMARY KEY NOT NULL,
    material_id BIGINT NOT NULL,
    b0 NUMERIC NOT NULL,
    b1 NUMERIC NOT NULL,
    b2 NUMERIC NOT NULL,
    b3 NUMERIC NOT NULL,
    b4 NUMERIC NOT NULL,
    b5 NUMERIC NOT NULL,
    b6 NUMERIC NOT NULL,
    b7 NUMERIC NOT NULL,
    b8 NUMERIC NOT NULL,
    FOREIGN KEY (material_id) REFERENCES material (id)
        ON DELETE CASCADE
);

ALTER TABLE IF EXISTS public.math_model
    OWNER to postgres;
