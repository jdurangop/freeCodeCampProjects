ALTER TABLE properties RENAME COLUMN weight TO atomic_mass;
ALTER TABLE properties RENAME COLUMN melting_point TO melting_point_celsius;
ALTER TABLE properties RENAME COLUMN boiling_point TO boiling_point_celsius;

ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL;
ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL;

ALTER TABLE elements ADD CONSTRAINT unique_element_symbol UNIQUE(symbol);
ALTER TABLE elements ADD CONSTRAINT unique_element_name UNIQUE(name);

ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL;
ALTER TABLE elements ALTER COLUMN name SET NOT NULL;

ALTER TABLE properties DROP CONSTRAINT properties_pkey;
ALTER TABLE properties ADD CONSTRAINT atomic_number_fkey FOREIGN KEY (atomic_number) REFERENCES elements(atomic_number);

CREATE TABLE types(
  type_id INT NOT NULL PRIMARY KEY,
  type VARCHAR NOT NULL
);

INSERT INTO types(type_id, type)
VALUES (1, 'nonmetal'), (2, 'metal'), (3, 'metalloid');

ALTER TABLE properties ADD COLUMN type_id INT;
ALTER TABLE properties ADD CONSTRAINT type_fkey FOREIGN KEY (type_id) REFERENCES types(type_id);
ALTER TABLE properties ALTER COLUMN atomic_mass TYPE NUMERIC;

UPDATE properties p
SET type_id = (SELECT type_id FROM types t WHERE t.type = p.type),
    atomic_mass = atomic_mass::REAL;

ALTER TABLE properties ALTER COLUMN type_id SET NOT NULL;
ALTER TABLE properties DROP COLUMN type;

UPDATE elements
SET symbol = INITCAP(symbol);

INSERT INTO elements(atomic_number, symbol, name)
VALUES  (9, 'F', 'Fluorine'),
        (10, 'Ne', 'Neon');

INSERT INTO properties(atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id)
VALUES  (9, 18.998, -220, -188.1, 1),
        (10, 20.18, -248.6, -246.1, 1);

DELETE FROM properties
WHERE atomic_number = 1000;

DELETE FROM elements
WHERE atomic_number = 1000;
