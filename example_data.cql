INSERT INTO ingredient (ingredient_id, unit, fat_per_unit, calories_per_unit, carbs_per_unit, price, amount_in_stock)
VALUES ('test_ingredient_1', 'meter', 100, 1000, 2, 1.33, 100);

INSERT INTO ingredient (ingredient_id, unit, fat_per_unit, calories_per_unit, carbs_per_unit, price, amount_in_stock)
VALUES ('test_ingredient_2', 'liter', 50, 1000, 50, 2.75, 50);

INSERT INTO ingredient (ingredient_id, unit, fat_per_unit, calories_per_unit, carbs_per_unit, price, amount_in_stock)
VALUES ('test_ingredient_3', 'einheiten', 0, 0, 0, 0.05, 99999);


INSERT INTO ingredients_by_recipe (recipe_id, amount, ingredient_id, unit, fat_per_unit, calories_per_unit, carbs_per_unit, price, amount_in_stock)
VALUES ('test_recipe_1', 1, 'test_ingredient_1', 'meter', 100, 1000, 2, 1.33, 100);

INSERT INTO ingredients_by_recipe (recipe_id, amount, ingredient_id, unit, fat_per_unit, calories_per_unit, carbs_per_unit, price, amount_in_stock)
VALUES ('test_recipe_1', 3, 'test_ingredient_2', 'liter', 50, 1000, 50, 2.75, 50);

INSERT INTO ingredients_by_recipe (recipe_id, amount, ingredient_id, unit, fat_per_unit, calories_per_unit, carbs_per_unit, price, amount_in_stock)
VALUES ('test_recipe_2', 1.25, 'test_ingredient_1', 'meter', 100, 1000, 2, 1.33, 100);

INSERT INTO ingredients_by_recipe (recipe_id, amount, ingredient_id, unit, fat_per_unit, calories_per_unit, carbs_per_unit, price, amount_in_stock)
VALUES ('test_recipe_2', 2, 'test_ingredient_2', 'liter', 50, 1000, 50, 2.75, 50);

INSERT INTO ingredients_by_recipe (recipe_id, amount, ingredient_id, unit, fat_per_unit, calories_per_unit, carbs_per_unit, price, amount_in_stock)
VALUES ('test_recipe_2', 3.5, 'test_ingredient_3', 'einheiten', 0, 0, 0, 0.05, 99999);

INSERT INTO ingredients_by_recipe (recipe_id, amount, ingredient_id, unit, fat_per_unit, calories_per_unit, carbs_per_unit, price, amount_in_stock)
VALUES ('test_recipe_3', 0.6666666, 'test_ingredient_3', 'einheiten', 0, 0, 0, 0.05, 99999);


INSERT INTO metadata_by_recipe (recipe_Id, cat_cool_food, cat_tasty, no_soy, no_water)
VALUES ('test_recipe_1', true, true, true, true);

INSERT INTO metadata_by_recipe (recipe_Id, cat_not_so_tasty, no_egg, no_milk, no_water)
VALUES ('test_recipe_2', true, true, true, true);

INSERT INTO metadata_by_recipe (recipe_Id, cat_cool_food, no_egg, no_milk, no_soy)
VALUES ('test_recipe_3', true, true, true, true);