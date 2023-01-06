// alten keyspace löschen
DROP KEYSPACE IF EXISTS beets_and_roots;

// keyspace neu erstellen
CREATE KEYSPACE beets_and_roots
WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

// in dem neu erstellten keyspace arbeiten
USE beets_and_roots;


// tabelle für zutaten erstellen
CREATE TABLE ingredient (
    ingredient_id text,
    unit text,
    fat_per_unit decimal,
    calories_per_unit decimal,
    carbs_per_unit decimal,
    price decimal,
    amount_in_stock decimal,
    PRIMARY KEY (ingredient_id)
);


// tabelle für zutat zu rezept abfrage erstellen
CREATE TABLE ingredients_by_recipe (
    recipe_id text,
    amount decimal,
    ingredient_id text,
    unit text,
    fat_per_unit decimal,
    calories_per_unit decimal,
    carbs_per_unit decimal,
    price decimal, // eventuell entfernen, aufgrund häufigen Aktualisierungsbedarfes
    amount_in_stock decimal, // eventuell entfernen, aufgrund häufigen Aktualisierungsbedarfes (sehr akut)
    PRIMARY KEY (recipe_id, ingredient_id)
);

// für leichteres aktualisieren von daten der zutaten
CREATE INDEX ON ingredients_by_recipe (ingredient_id);


// tabelle für die Metadaten der Rezepte erstellen
CREATE TABLE metadata_by_recipe (
    recipe_id text,
	// cat_* und no_* nur auf "true" abfragen!!!!!
	// cat_* = kategorie
    cat_cool_food boolean,
	cat_tasty boolean,
	cat_not_so_tasty boolean,
	// no_* = beschränkung
    no_egg boolean,
	no_milk boolean,
	no_soy boolean,
	no_water boolean,
    PRIMARY KEY (recipe_id)
);

// neue kategorie oder beschränkung hinzufügen über "ALTER TABLE metadata_by_recipe ADD <name> boolean" und anschließend "CREATE INDEX ON metadata_by_recipe <name>"

// ermöglicht das filtern anhand von Kategorien
CREATE INDEX ON metadata_by_recipe (cat_cool_food);
CREATE INDEX ON metadata_by_recipe (cat_tasty);
CREATE INDEX ON metadata_by_recipe (cat_not_so_tasty);
// ermöglicht das filtern anhand von Beschränkungen
CREATE INDEX ON metadata_by_recipe (no_egg);
CREATE INDEX ON metadata_by_recipe (no_milk);
CREATE INDEX ON metadata_by_recipe (no_soy);
CREATE INDEX ON metadata_by_recipe (no_water);
