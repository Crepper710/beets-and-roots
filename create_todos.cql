CREATE KEYSPACE IF NOT EXISTS beets_and_roots WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'};


USE beets_and_roots;

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


CREATE TABLE orders_by_custloc (
    location text,
    created_at timestamp,
    customer_uuid uuid,
    customer_name text,
    ingredients_name text,
    ingredients_uuid uuid,
    ingredients_ammount int,
    ingredients_price decimal,
    order_uuid uuid,
    PRIMARY KEY ((location), created_at, order_uuid, ingredients_uuid)
);
 
CREATE INDEX ON orders_by_custloc (customer_uuid);


Create Table supplier_by_location (
    location text,
    supplier_name text,
    supplier_uuid uuid,
    ingredient_name text,
    ingredient_uuid uuid,
    unit text,
    carbs_per_unit double,
    protein_per_unit double,
    calories_per_unit double,
    price_per_unit double,
    Primary Key ((location), supplier_uuid, ingredient_uuid)
);

CREATE INDEX ON supplier_by_location (ingredient_uuid);


CREATE TABLE customer_by_location (
    location text,
    id uuid,
    surname text,
    firstname text,
    address_line_1 text,
    address_line_2 text,
    phone_number text,
    email_address text,
    PRIMARY KEY ((location), id)
);

CREATE INDEX ON customer_by_location (id);











// Salat
INSERT INTO recipe (
    id,
    name,
    description,
    instructions,
    categories,
    restrictions,
    type,
    ingredient_id,
    ingredient_name,
    amount_in_recipe,
    unit,
    carbs_per_unit,
    protein_per_unit,
    calories_per_unit,
    price_per_unit
) VALUES (
    00000000-0000-0000-0000-000000000001,
    'salad',
    'a tasty salad.',
    'put all ingredients in a mixing bowl and mix them.',
    {'vegan'},
    {'no_milk', 'no_egg'},
    'starter',
    00000000-0000-0000-0000-000000001003,
    'tomato',
    0.5,
    'pieces',
    2.6,
    1.0,
    18.0,
    0.45
);

INSERT INTO recipe (
    id,
    name,
    description,
    instructions,
    categories,
    restrictions,
    type,
    ingredient_id,
    ingredient_name,
    amount_in_recipe,
    unit,
    carbs_per_unit,
    protein_per_unit,
    calories_per_unit,
    price_per_unit
) VALUES (
    00000000-0000-0000-0000-000000000001,
    'salad',
    'a tasty salad.',
    'cut all ingredients, put them inside a mixing bowl and mix them.',
    {'vegan'},
    {'no_milk', 'no_egg'},
    'starter',
    00000000-0000-0000-0000-000000001007,
    'rucola',
    1.0,
    'bundle',
    2.1,
    2.6,
    27.0,
    0.9
);


// Kartoffelpüree
INSERT INTO recipe (
    id,
    name,
    description,
    instructions,
    categories,
    restrictions,
    type,
    ingredient_id,
    ingredient_name,
    amount_in_recipe,
    unit,
    carbs_per_unit,
    protein_per_unit,
    calories_per_unit,
    price_per_unit
) VALUES (
    00000000-0000-0000-0000-000000000002,
    'mashed potatoes',
    'if you like potatoes, you will love this.',
    'cook to potatoes for 30 minutes. after that mash them, and mix in the milk. cut the chives and garnish the mash using the cut chives.',
    {'vegetarian'},
    {'no_egg'},
    'main dish',
    00000000-0000-0000-0000-000000001006,
    'potato',
    10.0,
    'pieces',
    14.6,
    0.2,
    71.0,
    0.15
);

INSERT INTO recipe (
    id,
    name,
    description,
    instructions,
    categories,
    restrictions,
    type,
    ingredient_id,
    ingredient_name,
    amount_in_recipe,
    unit,
    carbs_per_unit,
    protein_per_unit,
    calories_per_unit,
    price_per_unit
) VALUES (
    00000000-0000-0000-0000-000000000002,
    'mashed potatoes',
    'if you like potatoes, you will love this.',
    'cook to potatoes for 30 minutes. after that mash them, and mix in the milk. cut the chives and garnish the mash using the cut chives.',
    {'vegetarian'},
    {'no_egg'},
    'main dish',
    00000000-0000-0000-0000-000000003001,
    'milk',
    0.25,
    'liters',
    4.7,
    3.4,
    65.0,
    1.5
);

INSERT INTO recipe (
    id,
    name,
    description,
    instructions,
    categories,
    restrictions,
    type,
    ingredient_id,
    ingredient_name,
    amount_in_recipe,
    unit,
    carbs_per_unit,
    protein_per_unit,
    calories_per_unit,
    price_per_unit
) VALUES (
    00000000-0000-0000-0000-000000000002,
    'mashed potatoes',
    'if you like potatoes, you will love this.',
    'cook to potatoes for 30 minutes. after that mash them, and mix in the milk. cut the chives and garnish the mash using the cut chives.',
    {'vegetarian'},
    {'no_egg'},
    'main dish',
    00000000-0000-0000-0000-000000001012,
    'chives',
    0.25,
    'bundles',
    1.0,
    3.0,
    28.0,
    0.9
);


// omelett
INSERT INTO recipe (
    id,
    name,
    description,
    instructions,
    categories,
    restrictions,
    type,
    ingredient_id,
    ingredient_name,
    amount_in_recipe,
    unit,
    carbs_per_unit,
    protein_per_unit,
    calories_per_unit,
    price_per_unit
) VALUES (
    00000000-0000-0000-0000-000000000003,
    'omelet',
    'have great start in the day, with a great omelet.',
    'crack the eggs into a mixing bowl and mix them. put the mixed eggs into a sligthly oiled pan. cut the chives. wait until the egg has almost fully hardend and throw the cut chives on top. remove the egg from the pan, when its fully hardend.',
    {'vegetarian', 'breakfest'},
    {'no_milk'},
    'main dish',
    00000000-0000-0000-0000-000000004001,
    'egg',
    3.0,
    'pieces',
    1.5,
    11.9,
    137.0,
    0.4
);

INSERT INTO recipe (
    id,
    name,
    description,
    instructions,
    categories,
    restrictions,
    type,
    ingredient_id,
    ingredient_name,
    amount_in_recipe,
    unit,
    carbs_per_unit,
    protein_per_unit,
    calories_per_unit,
    price_per_unit
) VALUES (
    00000000-0000-0000-0000-000000000003,
    'omelet',
    'have great start in the day, with a great omelet.',
    'crack the eggs into a mixing bowl and mix them. put the mixed eggs into a sligthly oiled pan. cut the chives. wait until the egg has almost fully hardend and throw the cut chives on top. remove the egg from the pan, when its fully hardend.',
    {'vegetarian', 'breakfest'},
    {'no_milk'},
    'main dish',
    00000000-0000-0000-0000-000000001012,
    'chives',
    0.25,
    'bundles',
    1.0,
    3.0,
    28.0,
    0.9
);


// apfel stückchen
INSERT INTO recipe (
    id,
    name,
    description,
    instructions,
    categories,
    restrictions,
    type,
    ingredient_id,
    ingredient_name,
    amount_in_recipe,
    unit,
    carbs_per_unit,
    protein_per_unit,
    calories_per_unit,
    price_per_unit
) VALUES (
    00000000-0000-0000-0000-000000000004,
    'apple slices',
    'a tasty and complexly made delicacy.',
    'cut the apples lol.',
    {'vegan'},
    {'no_milk', 'no_egg'},
    'dessert',
    00000000-0000-0000-0000-000000002001,
    'apple',
    1.0,
    'pieces',
    14.4,
    0.3,
    54.0,
    1.2
);


// würstchen mit kartoffelsalat
INSERT INTO recipe (
    id,
    name,
    description,
    instructions,
    categories,
    restrictions,
    type,
    ingredient_id,
    ingredient_name,
    amount_in_recipe,
    unit,
    carbs_per_unit,
    protein_per_unit,
    calories_per_unit,
    price_per_unit
) VALUES (
    00000000-0000-0000-0000-000000000005,
    'wiener sausages with potato salad',
    'certified german christmas classic',
    'boil water in 2 cooking pots. put the veggie broth in one and the sausages in the other (be careful to use the correct amount of water for your veggie broth). Chop the potatoes and onions and mix them with the broth. serve everything on a plate.',
    {},
    {'no_milk', 'no_egg'},
    'main dish',
    00000000-0000-0000-0000-000000005001,
    'wiener sausage',
    3.0,
    'pieces',
    1.2,
    9.9,
    331.0,
    1.8
);

INSERT INTO recipe (
    id,
    name,
    description,
    instructions,
    categories,
    restrictions,
    type,
    ingredient_id,
    ingredient_name,
    amount_in_recipe,
    unit,
    carbs_per_unit,
    protein_per_unit,
    calories_per_unit,
    price_per_unit
) VALUES (
    00000000-0000-0000-0000-000000000005,
    'wiener sausages with potato salad',
    'certified german christmas classic',
    'boil water in 2 cooking pots. put the veggie broth in one and the sausages in the other (be careful to use the correct amount of water for your veggie broth). Chop the potatoes and onions and mix them with the broth. serve everything on a plate.',
    {},
    {'no_milk', 'no_egg'},
    'main dish',
    00000000-0000-0000-0000-000000001006,
    'potato',
    10.0,
    'pieces',
    14.6,
    0.2,
    71.0,
    0.15
);

INSERT INTO recipe (
    id,
    name,
    description,
    instructions,
    categories,
    restrictions,
    type,
    ingredient_id,
    ingredient_name,
    amount_in_recipe,
    unit,
    carbs_per_unit,
    protein_per_unit,
    calories_per_unit,
    price_per_unit
) VALUES (
    00000000-0000-0000-0000-000000000005,
    'wiener sausages with potato salad',
    'certified german christmas classic',
    'boil water in 2 cooking pots. put the veggie broth in one and the sausages in the other (be careful to use the correct amount of water for your veggie broth). Chop the potatoes and onions and mix them with the broth. serve everything on a plate.',
    {},
    {'no_milk', 'no_egg'},
    'main dish',
    00000000-0000-0000-0000-000000001002,
    'onion',
    0.25,
    'pieces',
    4.9,
    1.2,
    28.0,
    0.15
);

INSERT INTO recipe (
    id,
    name,
    description,
    instructions,
    categories,
    restrictions,
    type,
    ingredient_id,
    ingredient_name,
    amount_in_recipe,
    unit,
    carbs_per_unit,
    protein_per_unit,
    calories_per_unit,
    price_per_unit
) VALUES (
    00000000-0000-0000-0000-000000000005,
    'wiener sausages with potato salad',
    'certified german christmas classic',
    'boil water in 2 cooking pots. put the veggie broth in one and the sausages in the other (be careful to use the correct amount of water for your veggie broth). Chop the potatoes and onions and mix them with the broth. serve everything on a plate.',
    {},
    {'no_milk', 'no_egg'},
    'main dish',
    00000000-0000-0000-0000-000000007043,
    'veggie broth',
    1.0,
    'cubes',
    0.5,
    0.5,
    1.0,
    0.2
);













INSERT INTO customer_by_location (location, id, surname, firstname, address_line_1, address_line_2, phone_number, email_address) VALUES ('ham', 00000000-0000-0000-0000-000000002001, 'Wellensteyn','Kira','Eppendorfer Landstrasse 104', '20249 Hamburg','040/443322','k.wellensteyn@yahoo.de');

INSERT INTO customer_by_location (location, id, surname, firstname, address_line_1, address_line_2, phone_number, email_address) VALUES ('ham', 00000000-0000-0000-0000-000000002002, 'Foede','Dorothea','Ohmstraße 23', '22765 Hamburg','040/543822','d.foede@web.de');

INSERT INTO customer_by_location (location, id, surname, firstname, address_line_1, address_line_2, phone_number, email_address) VALUES ('ham', 00000000-0000-0000-0000-000000002003, 'Leberer','Sigrid','Bilser Berg 6', '20459 Hamburg','0175/1234588','sigrid@leberer.de');

INSERT INTO customer_by_location (location, id, surname, firstname, address_line_1, address_line_2, phone_number, email_address) VALUES ('ham', 00000000-0000-0000-0000-000000002004, 'Soerensen','Hanna','Alter Teichweg 95', '22049 Hamburg','040/634578','h.soerensen@yahoo.de');

INSERT INTO customer_by_location (location, id, surname, firstname, address_line_1, address_line_2, phone_number, email_address) VALUES ('bar', 00000000-0000-0000-0000-000000002005, 'Schnitter','Marten','Stübels 10', '22835 Barsbüttel','0176/447587','schni_mart@gmail.com');

INSERT INTO customer_by_location (location, id, surname, firstname, address_line_1, address_line_2, phone_number, email_address) VALUES ('ham', 00000000-0000-0000-0000-000000002006, 'Maurer','Belinda','Grotelertwiete 4a', '21075 Hamburg','040/332189','belinda1978@yahoo.de');

INSERT INTO customer_by_location (location, id, surname, firstname, address_line_1, address_line_2, phone_number, email_address) VALUES ('ham', 00000000-0000-0000-0000-000000002007, 'Gessert','Armin','Küstersweg 3', '21079 Hamburg','040/67890','armin@gessert.de');

INSERT INTO customer_by_location (location, id, surname, firstname, address_line_1, address_line_2, phone_number, email_address) VALUES ('ham', 00000000-0000-0000-0000-000000002008, 'Haessig','Jean-Marc','Neugrabener Bahnhofstraße 30', '21149 Hamburg','0178-67013390','jm@haessig.de');

INSERT INTO customer_by_location (location, id, surname, firstname, address_line_1, address_line_2, phone_number, email_address) VALUES ('ham', 00000000-0000-0000-0000-000000002009, 'Urocki','Eric','Elbchaussee 228', '22605 Hamburg','0152-96701390','urocki@outlook.de');












INSERT INTO orders_by_custloc (
    location,
    created_at,
    order_uuid,
    customer_uuid,
    customer_name,
    ingredients_uuid,
    ingredients_ammount,
    ingredients_name,
    ingredients_price
) VALUES (
    'ham',
    0,
    00000000-0000-0000-0000-000000000001,
    00000000-0000-0000-0000-000000002001,
    'Kira Wellensteyn',
    00000000-0000-0000-0000-000000002003,
    10,
    'apple',
    1.2
);

INSERT INTO orders_by_custloc (
    location,
    created_at,
    order_uuid,
    customer_uuid,
    customer_name,
    ingredients_uuid,
    ingredients_ammount,
    ingredients_name,
    ingredients_price
) VALUES (
    'bar',
    '2000-1-1 00:00+0000',
    00000000-0000-0000-0000-000000000002,
    00000000-0000-0000-0000-000000002005,
    'Marten Schnitter',
    00000000-0000-0000-0000-000000001003,
    3,
    'tomato',
    0.45
);

INSERT INTO orders_by_custloc (
    location,
    created_at,
    order_uuid,
    customer_uuid,
    customer_name,
    ingredients_uuid,
    ingredients_ammount,
    ingredients_name,
    ingredients_price
) VALUES (
    'bar',
    '2000-1-1 00:00+0000',
    00000000-0000-0000-0000-000000000002,
    00000000-0000-0000-0000-000000002005,
    'Marten Schnitter',
    00000000-0000-0000-0000-000000001007,
    5,
    'rucola',
    0.9
);

INSERT INTO orders_by_custloc (
    location,
    created_at,
    order_uuid,
    customer_uuid,
    customer_name,
    ingredients_uuid,
    ingredients_ammount,
    ingredients_name,
    ingredients_price
) VALUES (
    'ham',
    '2011-11-11 11:11+0000',
    00000000-0000-0000-0000-000000000003,
    00000000-0000-0000-0000-000000002007,
    'Armin Gessert',
    00000000-0000-0000-0000-000000005001,
    3,
    'wiener sausage',
    1.8
);

INSERT INTO orders_by_custloc (
    location,
    created_at,
    order_uuid,
    customer_uuid,
    customer_name,
    ingredients_uuid,
    ingredients_ammount,
    ingredients_name,
    ingredients_price
) VALUES (
    'ham',
    '2011-11-11 11:11+0000',
    00000000-0000-0000-0000-000000000003,
    00000000-0000-0000-0000-000000002007,
    'Armin Gessert',
    00000000-0000-0000-0000-000000001006,
    10,
    'potato',
    0.15
);

INSERT INTO orders_by_custloc (
    location,
    created_at,
    order_uuid,
    customer_uuid,
    customer_name,
    ingredients_uuid,
    ingredients_ammount,
    ingredients_name,
    ingredients_price
) VALUES (
    'ham',
    '2011-11-11 11:11+0000',
    00000000-0000-0000-0000-000000000003,
    00000000-0000-0000-0000-000000002007,
    'Armin Gessert',
    00000000-0000-0000-0000-000000001002,
    1,
    'onion',
    0.15
);

INSERT INTO orders_by_custloc (
    location,
    created_at,
    order_uuid,
    customer_uuid,
    customer_name,
    ingredients_uuid,
    ingredients_ammount,
    ingredients_name,
    ingredients_price
) VALUES (
    'ham',
    '2011-11-11 11:11+0000',
    00000000-0000-0000-0000-000000000003,
    00000000-0000-0000-0000-000000002007,
    'Armin Gessert',
    00000000-0000-0000-0000-000000007043,
    1,
    'veggie broth',
    0.2
);












insert into supplier_by_location (location, supplier_uuid, ingredient_uuid, calories_per_unit, carbs_per_unit, ingredient_name, price_per_unit, protein_per_unit, supplier_name, unit) Values ('ham', 00000000-0000-0000-0000-000000000001, 00000000-0000-0000-0000-000000002003, 54, 14.4, 'apple', 1.2, 0.3, 'Bio-Hof Müller', 'pieces');
insert into supplier_by_location (location, supplier_uuid, ingredient_uuid, calories_per_unit, carbs_per_unit, ingredient_name, price_per_unit, protein_per_unit, supplier_name, unit) Values ('ham', 00000000-0000-0000-0000-000000000001, 00000000-0000-0000-0000-000000001003, 18, 2.6, 'tomato', 0.45, 1, 'Bio-Hof Müller', 'pieces');
insert into supplier_by_location (location, supplier_uuid, ingredient_uuid, calories_per_unit, carbs_per_unit, ingredient_name, price_per_unit, protein_per_unit, supplier_name, unit) Values ('ham', 00000000-0000-0000-0000-000000000001, 00000000-0000-0000-0000-000000001007, 27, 2.1, 'rucola', 0.9, 2.6, 'Bio-Hof Müller', 'bundle');
insert into supplier_by_location (location, supplier_uuid, ingredient_uuid, calories_per_unit, carbs_per_unit, ingredient_name, price_per_unit, protein_per_unit, supplier_name, unit) Values ('ham', 00000000-0000-0000-0000-000000000001, 00000000-0000-0000-0000-000000001006, 71, 14.6, 'potato', 0.15, 2.0, 'Bio-Hof Müller','pieces');
insert into supplier_by_location (location, supplier_uuid, ingredient_uuid, calories_per_unit, carbs_per_unit, ingredient_name, price_per_unit, protein_per_unit, supplier_name, unit) Values ('ham', 00000000-0000-0000-0000-000000000001, 00000000-0000-0000-0000-000000001002, 28, 4.9, 'onion', 0.15, 1.2, 'Bio-Hof Müller','pieces');
insert into supplier_by_location (location, supplier_uuid, ingredient_uuid, calories_per_unit, carbs_per_unit, ingredient_name, price_per_unit, protein_per_unit, supplier_name, unit) Values ('ham', 00000000-0000-0000-0000-000000000001, 00000000-0000-0000-0000-000000007043, 1, 0.5, 'veggie broth', 0.2, 0.5, 'Bio-Hof Müller','cubes');
insert into supplier_by_location (location, supplier_uuid, ingredient_uuid, calories_per_unit, carbs_per_unit, ingredient_name, price_per_unit, protein_per_unit, supplier_name, unit) Values ('ham', 00000000-0000-0000-0000-000000000001, 00000000-0000-0000-0000-000000001012, 28, 1.0, 'chives', 0.9, 3.0, 'Bio-Hof Müller','bundle');
insert into supplier_by_location (location, supplier_uuid, ingredient_uuid, calories_per_unit, carbs_per_unit, ingredient_name, price_per_unit, protein_per_unit, supplier_name, unit) Values ('ham', 00000000-0000-0000-0000-000000000001, 00000000-0000-0000-0000-000000004001, 137, 1.5, 'egg', 0.4, 11.9, 'Bio-Hof Müller','pieces');
insert into supplier_by_location (location, supplier_uuid, ingredient_uuid, calories_per_unit, carbs_per_unit, ingredient_name, price_per_unit, protein_per_unit, supplier_name, unit) Values ('bar', 00000000-0000-0000-0000-000000000002, 00000000-0000-0000-0000-000000003001, 65, 4.7, 'milk', 1.5, 3.4, 'Molkerei Henning','liter');
insert into supplier_by_location (location, supplier_uuid, ingredient_uuid, calories_per_unit, carbs_per_unit, ingredient_name, price_per_unit, protein_per_unit, supplier_name, unit) Values ('bar', 00000000-0000-0000-0000-000000000002, 00000000-0000-0000-0000-000000003003, 741, 0.6, 'Butter', 3.0, 0.7, 'Molkerei Henning','bars');
insert into supplier_by_location (location, supplier_uuid, ingredient_uuid, calories_per_unit, carbs_per_unit, ingredient_name, price_per_unit, protein_per_unit, supplier_name, unit) Values ('bar', 00000000-0000-0000-0000-000000000002, 00000000-0000-0000-0000-000000003002, 241, 1.0, 'mozzarella', 3.5, 18.1, 'Molkerei Henning','pieces');
insert into supplier_by_location (location, supplier_uuid, ingredient_uuid, calories_per_unit, carbs_per_unit, ingredient_name, price_per_unit, protein_per_unit, supplier_name, unit) Values ('ham', 00000000-0000-0000-0000-000000000003, 00000000-0000-0000-0000-000000005001, 331, 1.2, 'wiener sausage',1.8, 9.9, 'Mary had a little lamb','pieces'); 
insert into supplier_by_location (location, supplier_uuid, ingredient_uuid, calories_per_unit, carbs_per_unit, ingredient_name, price_per_unit, protein_per_unit, supplier_name, unit) Values ('ham', 00000000-0000-0000-0000-000000000003, 00000000-0000-0000-0000-000000005002, 500, 1.5, 'beef', 4.0, 13.7, 'Mary had a little lamb','pieces');