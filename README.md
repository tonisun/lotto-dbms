# Lotto - Database Management System
![Logo egosanto.de](assets/images/documentation/logo.png)
## Data Models Development

- **Entities** - Represent real world object or concept
  - Euro Jackpot Draws ```{ data_base_name: "ej_draws", API_name: "EuroJackpotDraws" }```
  - All Euro Jackpot Rows ```{ data_base_name: "ej_all_rows", API_name: "EuroJackpotAllRows" }```
  <br>

  - 6 from 49 Draws ```{ ... }```
  - All 6 from 49 Rows ```{ ... }```
  <br>
  
  - ... ```{ ... }```
<br><br>

- **Attributes** - Furder describe an entity
Entity ```ej_draws```
<table>
|   fields:   | date | n1  | n2  | n3  | n4  | n5 | en1 | en2 | 
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| types: | date or varchar(10) | integer(2) | integer(2) | integer(2) | integer(2) | integer(2) | integer(2) | integer(2) |
| : | Primary Key unique {date..n5} | unique {n1..n5} | unique {n1..n5} | unique {n1..n5} | unique {n1..n5} | unique {n1..n5} | unique {en1, en2} | unique {en1, en2} |
| desc: | "YYYY-MM-DD" | {1..50} | {1..50} | {1..50} | {1..50} | {1..50} | {1..12} | {1..12} |
<br><br>

- **Relationships** - Association among 2 or more entities
```ej_draws``` - none yet

## Data Definition for MySQL and PostgreSQL
