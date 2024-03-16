DROP TABLE IF EXISTS landing_mission;
DROP TABLE IF EXISTS moon;
DROP TABLE IF EXISTS planet;
DROP TABLE IF EXISTS star;
DROP TABLE IF EXISTS galaxy;

CREATE TABLE galaxy(
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(60) NOT NULL UNIQUE,
  diameter_in_ly INT NOT NULL,
  description TEXT,
  age_in_millions_of_years INT,
  galaxy_type VARCHAR(20) NOT NULL
);

CREATE TABLE star(
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(60) NOT NULL UNIQUE,
  temperature_in_k INT NOT NULL,
  age_in_millions_of_years INT,
  galaxy_id INT NOT NULL,
  FOREIGN KEY(galaxy_id) REFERENCES galaxy(galaxy_id)
);

CREATE TABLE planet(
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(60) NOT NULL UNIQUE,
  mean_radius_in_km NUMERIC(20,2),
  star_id INT NOT NULL,
  has_rings BOOLEAN NOT NULL,
  FOREIGN KEY(star_id) REFERENCES star(star_id)
);

CREATE TABLE moon(
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(60) NOT NULL UNIQUE,
  distance_from_planet_in_km NUMERIC(20, 2),
  radius_in_km NUMERIC(20, 2),
  planet_id INT NOT NULL,
  FOREIGN KEY(planet_id) REFERENCES planet(planet_id)
);

CREATE TABLE landing_mission(
  landing_mission_id SERIAL PRIMARY KEY,
  date DATE NOT NULL,
  name VARCHAR(60) UNIQUE,
  country TEXT,
  was_successful BOOLEAN NOT NULL,
  planet_id INT NOT NULL,
  FOREIGN KEY(planet_id) REFERENCES planet(planet_id)
);
