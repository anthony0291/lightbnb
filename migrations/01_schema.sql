-- CREATE TABLE DATABASE

-- \i migrations/01_schema.sql 
-- run in appropriate directory with sql running

DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS properties CASCADE;
DROP TABLE IF EXISTS reservations CASCADE;
DROP TABLE IF EXISTS property_reviews CASCADE;

CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL
);

CREATE TABLE properties (
  id SERIAL PRIMARY KEY NOT NULL,
  owner_id INTEGER REFERENCES users(id) ON DELETE CASCADE,

  title VARCHAR(255) NOT NULL,
  description TEXT,
  thumbnail_photo_url VARCHAR(255) NOT NULL,
  cover_photo_url VARCHAR(255) NOT NULL,
  cost_per_night INTEGER  NOT NULL DEFAULT 0,
  parking_spaces INTEGER  NOT NULL DEFAULT 0,
  number_of_bathrooms INTEGER  NOT NULL DEFAULT 0,
  number_of_bedrooms INTEGER  NOT NULL DEFAULT 0,

  country VARCHAR(255) NOT NULL,
  street VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL,
  province VARCHAR(255) NOT NULL,
  post_code VARCHAR(255) NOT NULL,

  active BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE reservations (
  id SERIAL PRIMARY KEY NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  property_id INTEGER REFERENCES properties(id) ON DELETE CASCADE,
  guest_id INTEGER REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE property_reviews (
  id SERIAL PRIMARY KEY NOT NULL,
  guest_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  property_id INTEGER REFERENCES properties(id) ON DELETE CASCADE,
  reservation_id INTEGER REFERENCES reservations(id) ON DELETE CASCADE,
  rating SMALLINT NOT NULL DEFAULT 0,
  message TEXT
);


-- DROP TABLE IF EXISTS light_housebnb CASCADE;

-- CREATE TABLE users (
--   id INTEGER SERIAL PRIMARY KEY,
--   name VARCHAR(255) NOT NULL,
--   email VARCHAR(255) NOT NULL,
--   password VARCHAR(255) NOT NULL
-- )

-- CREATE TABLE properties (
--   id INTEGER SERIAL PRIMARY KEY,
--   owner id INTEGER,
--   title VARCHAR(255),
--   description TEXT,
--   thumbnail_photo_url VARCHAR(255),
--   cover_photo_url VARCHAR(255),
--   cost_per_night INTEGER,
--   parking_spaces INTEGER,
--   number_of_bathrooms INTEGER,
--   number_of_bedrooms INTEGER,
--   country VARCHAR(255),
--   province VARCHAR(255),
--   post_code VARCHAR(255),
--   active BOOLEAN,
-- )

-- CREATE TABLE reservations (
--   id INTEGER SERIAL PRIMARY KEY,
--   start_date DATE,
--   end_date DATE,
--   property_id INTEGER,
--   guest_id INTEGER
-- )
-- CREATE TABLE property_reviews (
--   id INTEGER SERIAL PRIMARY KEY,
--   guest_id INTEGER,
--   property_id INTEGER,
--   reservation_id INTEGER,
--   rating SMALLINT,
--   message TEXT
-- )


