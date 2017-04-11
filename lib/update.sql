UPDATE characters
SET species = "Martian"
WHERE id =
(SELECT max(id) FROM characters);
