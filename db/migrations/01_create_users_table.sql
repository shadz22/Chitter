CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(60), email VARCHAR(60) NOT NULL UNIQUE, username VARCHAR(60) NOT NULL UNIQUE, password VARCHAR(60));
