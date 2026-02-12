BEGIN;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TYPE media_type_enum AS ENUM ('VHS', 'LaserDisc', 'DVD', 'Blu-ray', 'Ultra HD Blu-ray');

CREATE TABLE media_types (
    id SERIAL PRIMARY KEY,
    name media_type_enum NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE media_items (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    media_type_id INTEGER NOT NULL REFERENCES media_types(id) ON DELETE CASCADE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

END;
