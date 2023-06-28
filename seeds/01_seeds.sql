--Writing Insert Queries
-- password bycrpt: $2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.

-- CREATE TABLE users (
--   id SERIAL PRIMARY KEY NOT NULL,
--   name VARCHAR(255) NOT NULL,
--   email VARCHAR(255) NOT NULL,
--   password VARCHAR(255) NOT NULL
-- );
INSERT INTO reservations (start_date, end_date, property_id, guest_id)
VALUES ('2018-09-11', '2018-09-26', 1, 1),
('2019-01-04', '2019-02-01', 2, 2),
('2021-10-01', '2021-10-14', 3, 3);

INSERT INTO users (name, email, password)
VALUES ("John", "john@gmail.com", "$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u."), 
("Jean", "jean@gmail.com", "$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u."),
("Sean", "sean@gmail.com", "$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.");

-- CREATE TABLE properties (
--   id SERIAL PRIMARY KEY NOT NULL,
--   owner_id INTEGER REFERENCES users(id) ON DELETE CASCADE,

--   title VARCHAR(255) NOT NULL,
--   description TEXT,
--   thumbnail_photo_url VARCHAR(255) NOT NULL,
--   cover_photo_url VARCHAR(255) NOT NULL,
--   cost_per_night INTEGER  NOT NULL DEFAULT 0,
--   parking_spaces INTEGER  NOT NULL DEFAULT 0,
--   number_of_bathrooms INTEGER  NOT NULL DEFAULT 0,
--   number_of_bedrooms INTEGER  NOT NULL DEFAULT 0,

--   country VARCHAR(255) NOT NULL,
--   street VARCHAR(255) NOT NULL,
--   city VARCHAR(255) NOT NULL,
--   province VARCHAR(255) NOT NULL,
--   post_code VARCHAR(255) NOT NULL,

--   active BOOLEAN NOT NULL DEFAULT TRUE
-- );
INSERT INFO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of bedrooms, country, street, city, province, post_code, active)
VALUES
(1, "Blanket", "description", "https://i.redd.it/p0ag8p91leu71.png", "https://media.npr.org/assets/img/2023/01/14/this-is-fine_custom-dcb93e90c4e1548ffb16978a5a8d182270c872a9-s1100-c50.jpg", 2, 1, 4, 'Canada', 'Donald', 'Ottawa', 'Ontario', 'K1K 1L5', true),
(2, "Blanket", "description", "https://i.redd.it/p0ag8p91leu71.png", "https://media.npr.org/assets/img/2023/01/14/this-is-fine_custom-dcb93e90c4e1548ffb16978a5a8d182270c872a9-s1100-c50.jpg", 2, 1, 4, 'Canada', 'Bell', 'Ottawa', 'Ontario', 'K1V 2H9', false),
(3, "Blanket", "description", "https://i.redd.it/p0ag8p91leu71.png", "https://media.npr.org/assets/img/2023/01/14/this-is-fine_custom-dcb93e90c4e1548ffb16978a5a8d182270c872a9-s1100-c50.jpg", 2, 1, 4, 'Canada', 'Aurugala', 'Ottawa', 'Ontario', 'K1L 1V5', true);

-- CREATE TABLE reservations (
--   id SERIAL PRIMARY KEY NOT NULL,
--   start_date DATE NOT NULL,
--   end_date DATE NOT NULL,
--   property_id INTEGER REFERENCES properties(id) ON DELETE CASCADE,
--   guest_id INTEGER REFERENCES users(id) ON DELETE CASCADE
-- );
INSERT INTO reservations (start_date, end_date, property_id, guest_id)
VALUES ('2018-09-11', '2018-09-26', 1, 1),
('2019-01-04', '2019-02-01', 2, 2),
('2021-10-01', '2021-10-14', 3, 3);

-- CREATE TABLE property_reviews (
--   id SERIAL PRIMARY KEY NOT NULL,
--   guest_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
--   property_id INTEGER REFERENCES properties(id) ON DELETE CASCADE,
--   reservation_id INTEGER REFERENCES reservations(id) ON DELETE CASCADE,
--   rating SMALLINT NOT NULL DEFAULT 0,
--   message TEXT
-- );
INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message)
VALUES (1, 2, 3, 4, "message"),
(2, 3, 2, 4, "message"),
(4, 10, 11, 4, "message");