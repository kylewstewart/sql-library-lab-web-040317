require 'pry'

def select_books_titles_and_years_in_first_series_order_by_year
  str = <<-sql
  SELECT Books.title, Books.year
  FROM Books
  JOIN Series
  ON Books.series_id = Series.id
  WHERE Series_id = 1
  ORDER BY Books.year;
  sql
end

def select_name_and_motto_of_char_with_longest_motto
  str = <<-sql
  SELECT name, motto
  FROM characters
  ORDER BY LENGTH(motto) DESC
  LIMIT 1;
  sql
end

def select_value_and_count_of_most_prolific_species
  str = <<-sql
  SELECT species, COUNT(species)
  FROM characters
  GROUP BY species
  ORDER BY COUNT(species) DESC
  LIMIT 1;
  sql
end

def select_name_and_series_subgenres_of_authors
  str = <<-sql
  SELECT Authors.name, Subgenres.name
  FROM Authors
  JOIN Series
  ON Authors.id = Series.author_id
  JOIN Subgenres
  ON Series.subgenre_id = Subgenres.id;
  sql
end

def select_series_title_with_most_human_characters
  str = <<-sql
  SELECT Series.title
  FROM Series
  JOIN Characters
  ON Series.id = Characters.series_id
  GROUP BY Characters.species
  ORDER BY COUNT(Characters.species) ASC
  LIMIT 1;
  sql
end

def select_character_names_and_number_of_books_they_are_in
  str = <<-sql
  SELECT Characters.name, COUNT(Character_books.character_id)
  FROM Characters
  JOIN Character_books
  ON Characters.id = Character_books.character_id
  GROUP BY Characters.name
  ORDER BY COUNT(Character_books.character_id) DESC;
  sql
end
