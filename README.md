FILM
  Dropped Columns: 
    Release_year
    original_language_id
  Moved columns to table Rental:
    Rental_duration
    rental_rate
  Moved column to Inventory:
    replacement_cost
  Created column as foreign key:
    Category_id

Merged CATEGORY into FILM_CATEGORY

Deleted table FILM_TEXT

Merged FILM_ACTOR into ACTOR

ADDRESS:
  Deleted:  
    Address2
  Added: 
    city_id, city, country_id, country

MERGED CITY and COUNTRY into ADDRESS

RENTAL:
  Added: 
    Film_id, rental_duration, rental_rate

