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
    price decimal, // eventuell entfernen, aufgrund häufigen Aktuisierungsbedarfes
    amount_in_stock decimal, // eventuell entfernen, aufgrund häufigen Aktuisierungsbedarfes (sehr akut)
    PRIMARY KEY (recipe_id, ingredient_id)
);

// für leichteres aktualisieren von daten der zutaten
CREATE INDEX ON ingredients_by_recipe (ingredient_id);


// tabelle für die Metadaten der Rezepte erstellen
CREATE TABLE metadata_by_recipe (
    recipe_id text,
    categories set<text>,
    restrictions set<text>,
    PRIMARY KEY (recipe_id)
);

// ermöglicht das filtern anhand von Kategorien
CREATE INDEX ON metadata_by_recipe (categories);
// ermöglicht das filtern anhand von Beschränkungen
CREATE INDEX ON metadata_by_recipe (restrictions);