-- Maria DB

-- Simple table
DROP TABLE IF EXISTS geo;

CREATE TABLE IF NOT EXISTS geo(
train_station smallint(2),
train_number smallint(2),
cod_entity smallint(2),
cod_capital smallint(2),
entity char(37),
capital char(37)
);

-- Extract from table `geo_base' and insert in `geo' table.
INSERT INTO geo(train_station, train_number, cod_entity, cod_capital, entity, capital)
SELECT * FROM geo_base WHERE capital = 'SEVASTOPOL';

-- Add new columns
ALTER TABLE geo ADD entity_pk char(9);
ALTER TABLE geo ADD capital_pk char(9);

-- Update column in the same table
UPDATE geo a JOIN geo b ON b.cod_entity = a.cod_entity SET a.entity_pk = CONCAT(a.cod_entity, '-', a.cod_capital)

-- Update column using another table
UPDATE geo a JOIN geo_base b ON a.entity_pk = b.entity_pk SET a.capital_pk = b.capital_pk;

-- Drop the generic table `geo_base' and change the name of the table `geo' by `geo_base'.
DROP TABLE geo_base;
RENAME TABLE `geo` TO `geo_base`;

-- Trigger for update table `geo_de' from the new `geo_base'
DELIMITER //
CREATE TRIGGER geo_de_trig
AFTER INSERT ON geo_base
FOR EACH ROW
BEGIN
IF NEW.capital = 'munchen' THEN
INSERT INTO geo_de(train_station, train_number, cod_entity, cod_capital, entity, capital) VALUES (NEW.train_station, NEW.train_number, NEW.cod_entity, NEW.cod_capital, NEW.entity, NEW.capital);
END IF;
END; //
DELIMITER ;
