-- DDL

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

CREATE TABLE medias (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    media_type_id INTEGER NOT NULL REFERENCES media_types(id) ON DELETE CASCADE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT medias_unique_title_type UNIQUE (title, media_type_id)
);

CREATE TABLE users_medias (
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    media_id INTEGER NOT NULL REFERENCES medias(id) ON DELETE CASCADE,
    added_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, media_id)
);

END;
