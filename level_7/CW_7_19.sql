/*
You have arrived at the Celadon Gym to battle Erika for the Rainbow Badge.

She will be using Grass-type Pokémon.
Your Fire-type Pokémon will be strong against Grass, while your Water-type Pokémon will be weakened.
The multipliers table in your Pokédex will adjust their strength accordingly.

Using the tables below, return the pokemon_name, modifiedStrength, and element of all Pokémon whose strength - after applying the multiplier - is greater than or equal to 40.
Order the results from strongest to weakest.

Pokemon table schema:
    - id
    - pokemon_name
    - element_id
    - str

Multipliers table schema:
    - id
    - element
    - multiplier

Return schema:
    - pokemon_name
    - modifiedStrength
    - element

Вы прибыли в Селадоновый зал, чтобы сразиться с Эрикой за Радужный значок.

Она использует покемонов травяного типа.
Ваши покемоны огненного типа будут сильны против травы, а водные - ослаблены.
Таблица multipliers в вашем Покедексе корректирует силу в зависимости от типа.

Используя таблицы ниже, выведите pokemon_name, modifiedStrength и element тех покемонов, чья сила после применения модификатора не меньше 40.
Отсортируйте результат от самого сильного к самому слабому.

Схема таблицы pokemon:
    - id
    - pokemon_name
    - element_id
    - str

Схема таблицы multipliers:
    - id
    - element
    - multiplier

Схема результата:
    - pokemon_name
    - modifiedStrength
    - element
*/

SELECT pokemon.pokemon_name, pokemon.str * multipliers.multiplier AS modifiedStrength, multipliers.element
FROM pokemon
JOIN multipliers ON pokemon.element_id = multipliers.id
WHERE pokemon.str * multipliers.multiplier >= 40
ORDER BY modifiedStrength DESC;