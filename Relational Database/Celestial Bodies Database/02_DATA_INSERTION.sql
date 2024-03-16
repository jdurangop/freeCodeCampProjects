INSERT INTO galaxy (galaxy_id, name, diameter_in_ly, description, age_in_millions_of_years, galaxy_type)
VALUES
  (1, 'Milky Way', 100000, 'Our home galaxy', 13000, 'Spiral'),
  (2, 'Andromeda', 220000, 'Nearest spiral galaxy', 2200, 'Spiral'),
  (3, 'Triangulum', 60000, 'Third-largest galaxy in the Local Group', 1300, 'Spiral'),
  (4, 'Messier 87', 1200000, 'Located in the Virgo Cluster', 6000, 'Elliptical'),
  (5, 'Whirlpool', 30000, 'Interacting with a smaller galaxy', 450, 'Spiral'),
  (6, 'Sombrero', 50000, 'Known for its bright nucleus and large central bulge', 800, 'Spiral');

INSERT INTO star (star_id, name, temperature_in_k, age_in_millions_of_years, galaxy_id)
VALUES
  (1, 'Sun', 5778, 4600, 1),
  (2, 'Proxima Centauri', 3042, 6000, 1),
  (3, 'Sirius', 9940, 250, 1),
  (4, 'Tau Ceti', 5344, 5700, 1),
  (5, 'V1400 Centauri', 4500, 5000, 1),
  (6, 'WASP-17', 6700, 4000, 2),
  (7, 'HD 209458', 6091, 4000, 1);

INSERT INTO planet(planet_id, name, mean_radius_in_km, has_rings, star_id)
VALUES
  (1, 'Earth', 6371.0, false, 1),
  (2, 'Mars', 3389.5, false, 1),
  (3, 'Venus', 6051.8, false, 1),
  (4, 'Jupiter', 69911.0, true, 1),
  (5, 'Uranus', 25362.0, true, 1),
  (6, 'Mercury', 2439.7, false, 1),
  (7, 'Saturn', 58232.0, true, 1),
  (8, 'Neptune', 24622.0, true, 1),
  (9, 'WASP-17b', 107241, false, 6),
  (10, 'HD 209458 b', 71492.0, false, 7),
  (11, 'J1407b', null, true, 5),
  (12, 'Tau Ceti e', 10971.0, false, 4);

INSERT INTO moon(moon_id, name, distance_from_planet_in_km, radius_in_km, planet_id)
VALUES
  (1, 'Moon', 384400, 1737.1, 1),
  (2, 'Phobos', 9377, 11.1, 2),
  (3, 'Deimos', 23460, 6.2, 2),
  (4, 'Io', 421800, 1821.6, 4),
  (5, 'Europa', 671100, 1560.8, 4),
  (6, 'Ganymede', 1070400, 2631.2, 4),
  (7, 'Callisto', 1882700, 2410.3, 4),
  (8, 'Titania', 435910, 788.9, 5),
  (9, 'Oberon', 583520, 761.4, 5),
  (10, 'Miranda', 129780, 235.8, 5),
  (11, 'Ariel', 190900, 578.9, 5),
  (12, 'Umbriel', 266000, 584.7, 5),
  (13, 'Triton', 354800, 1353.4, 8),
  (14, 'Nereid', 5513800, 170.0, 8),
  (15, 'Proteus', 117646, 210.0, 8),
  (16, 'Charon', 19591, 603.6, 9),
  (17, 'Hippocamp', 105283, 13.0, 10),
   (18, 'Moon X', 100000, 100, 1),
  (19, 'Rhea', 527040, 764.5, 7),
  (20, 'Dione', 377420, 561.4, 7);

INSERT INTO landing_mission(landing_mission_id, date, name, country, was_successful, planet_id)
VALUES
  (1, '1996-03-01', 'Venera 3', 'USSR', false, 3),
  (2, '1985-06-15', 'Vega 2 Lander', 'USSR', true, 3),
  (3, '2021-05-14', 'Tianwen-1 lander and Zhurong rover', 'China', true, 2);
