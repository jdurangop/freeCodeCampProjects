DROP DATABASE IF EXISTS number_guess;
CREATE DATABASE number_guess;

\c number_guess

CREATE TABLE users(
  user_id SERIAL PRIMARY KEY,
  name VARCHAR(22) NOT NULL UNIQUE
);

CREATE TABLE games(
  game_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES users(user_id),
  guesses INT NOT NULL
);
