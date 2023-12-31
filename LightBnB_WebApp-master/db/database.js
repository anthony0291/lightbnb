const properties = require("./json/properties.json");
const users = require("./json/users.json");

const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'lightbnb'
});

// pool.query(`SELECT title FROM properties LIMIT 10;`).then(response => {console.log(response)})

/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.

 * const getUserWithEmail = function (email) {
  let resolvedUser = null;
  for (const userId in users) {
    const user = users[userId];
    if (user?.email.toLowerCase() === email?.toLowerCase()) {
      resolvedUser = user;
    }
  }
  return Promise.resolve(resolvedUser);
};
 */

const getUserWithEmail = function (email) {
  return pool
  .query(`SELECT *
  FROM users
  WHERE email = $1 LIMIT 1`, [email])
  .then((result) => {
    // console.log('getUserWithEmail');
    // console.log(result.rows);

    if (result.rows.length > 0) {
      return result.rows[0];
    } else {
      return null;
      }
  })
  .catch((err) => {
    console.log(err.message);
  });
};



/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 
 * const getUserWithId = function (id) {
  return Promise.resolve(users[id]);
};
 */

const getUserWithId = function (id) {
  return pool
  .query(`SELECT * FROM users
  WHERE users.id = $1 LIMIT 1`, [id])
  .then((result) => {
    // console.log('getUserWithID');
    // console.log(result.rows);
    if (result.rows.length > 0) {
      return result.rows[0];
    } else {
      return null
    }
  })
  .catch((error) => {
    console.log(error.message)
  });
};

/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.

 * const addUser = function (user) {
  const userId = Object.keys(users).length + 1;
  user.id = userId;
  users[userId] = user;
  return Promise.resolve(user);
};
 */

const addUser = function (user) {
  return pool
  .query(`INSERT INTO users (name, email, password)
  VALUES ($1,$2,$3) RETURNING *;`,[user.name, user.email, user.password])
  .then((result) => {
    console.log('addUSER');
    console.log(result.rows);
   return result.rows; 
  })
  .catch((error) => console.log(error.message));
};


/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 
 * const getAllReservations = function (guest_id, limit = 10) {
  return getAllProperties(null, 2);
};
 */
const getAllReservations = function (guest_id, limit = 10) {
  return pool 
  .query (`SELECT reservations.id, properties.title, properties.cost_per_night, reservations.start_date, avg(rating) as average_rating
  FROM reservations
  JOIN properties ON reservations.property_id = properties.id
  JOIN property_reviews ON properties.id = property_reviews.property_id
  WHERE reservations.guest_id = $1
  GROUP BY properties.id, reservations.id
  ORDER BY reservations.start_date
  LIMIT $2`, [guest_id, limit])
  .then((result) => {
    console.log('getAllReservations');
    console.log(result.rows);
    return result.rows;
  })
  .catch((error) => console.log(error.message));
};


/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */
const getAllProperties = (options, limit = 10) => {
  return pool
    .query(`SELECT * 
    FROM properties
    LIMIT $1`, [limit])
    .then((result) => {
      // console.log(result.rows);
      return result.rows;
    })
    .catch((err) => {
      console.log(err.message);
    });
};

/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function (property) {
  const propertyId = Object.keys(properties).length + 1;
  property.id = propertyId;
  properties[propertyId] = property;
  return Promise.resolve(property);
};

module.exports = {
  getUserWithEmail,
  getUserWithId,
  addUser,
  getAllReservations,
  getAllProperties,
  addProperty,
};
