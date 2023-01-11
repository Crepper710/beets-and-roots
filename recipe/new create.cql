// SELECT name FROM recipe PER PARTION LIMIT 1 ORDER BY id

CREATE TABLE recipe (
	id uuid,
	name text,
	description text,
	instructions text,
	categories set<text>,
	restrictions set<text>,
	type text,
	ingredient_id uuid,
	ingredient_name text,
	amount_in_recipe double,
	unit text,
	carbs_per_unit double,
	protein_per_unit double,
	calories_per_unit double,
	price_per_unit double,
	PRIMARY KEY (id, ingredient_id)
);

CREATE INDEX ON recipe (categories);
CREATE INDEX ON recipe (restrictions);
CREATE INDEX ON recipe (type);