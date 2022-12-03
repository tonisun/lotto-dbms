# Lotto - Database Management System
![Logo egosanto.de](assets/images/documentation/logo.png)
<br><br>
## Data Description on `kaggle.com`#

- Binomial coefficient

    $$ \binom{n}{k} = \frac{n!}{k! \cdot ( n - k )!}  $$ 



- Faculty arithmetic

    $$ n! = 1\cdot2\cdot3\cdot4 ... n = \prod{k=1}^n{k} $$



- EuroJackpot [Kaggle => 5 from 50](https://www.kaggle.com/code/tonisun/5from50)

$$ \binom{50}{5} = \frac{50!}{5! \cdot ( 50 - 5 )!} = \frac{50!}{5! \cdot 45!} = $$ 

$$ = \frac{1\cdot2\cdot3\cdot .. \cdot 50}{1\cdot2\cdot3\cdot4\cdot5  \cdot  1\cdot2\cdot3\cdot .. \cdot 45} = $$

$$ = \frac{3,0414093201713378043612608166065e+64}{1,4354666503857623347435579379479e+58} = 2.118.760 $$

<br>

$$ \binom{12}{2} = \frac{12!}{2!\cdot(12-2)!} = \frac{12!}{2! \cdot 10!} = $$

$$ = \frac{1\cdot2\cdot3\cdot4\cdot5\cdot6\cdot7\cdot8\cdot9\cdot10\cdot11\cdot12}{1\cdot2\cdot1\cdot2\cdot3\cdot4\cdot5\cdot6\cdot7\cdot8\cdot9\cdot10} = $$

$$ = \frac{479.001.600}{7.257.600} = 66 $$

- Euro Jackpot \cdot 2 EuroNumbers(1..12)

$$ \binom{50}{5} \cdot \binom{12}{2} = 2.118.760 \cdot 66 = 139.838.160$$

- 6 from 49 \cdot 1 SuperZahl(0..9)  

$$ \binom{49}{6} \cdot \binom{10}{1} = 13.983.816  \cdot  10 = 139.838.160 $$

<br><br>
## Data Models Development

- **Entities** - Represent real world object or concept
  - Euro Jackpot Draws ```{ data_base_name: "ej_draw", API_name: "EuroJackpotDraw" }```
  - All Euro Jackpot Rows ```{ data_base_name: "ej_row", API_name: "EuroJackpotRow" }```
  <br>

  - 6 from 49 Draws ```{ ... }```
  - All 6 from 49 Rows ```{ ... }```
  <br>
  
  - ... ```{ ... }```

<br>



- **Attributes** - Furder describe an entity
  - Entity ```ej_draw```

<style>
    table {
        font-size: 12px;
    }
</style>

<table >
    <header>
        <tr>
            <th>fields: </th><th>date</th><th>n1</th><th>n2</th><th>n3</th><th>n4</th><th>n5</th><th>en1</th><th>en2</th>
        </tr>
    </header>
    <body>
         <tr>
            <th>types: </th><td>date or <br>varchar(10)</td><td>integer(2)</td><td>integer(2)</td><td>integer(2)</td><td>integer(2)</td><td>integer(2)</td><td>integer(2)</td><td>integer(2)</td>
        </tr>
        <tr>
            <th>constraints: </th><td>Primary Key<br> unique <br>{date..n5}</td><td>unique {n1..n5}</td><td>unique {n1..n5}</td><td>unique {n1..n5}</td><td>unique {n1..n5}</td><td>unique {n1..n5}</td><td>unique {en1, en2}</td><td>unique {en1, en2}</td>
        </tr>
        <tr>
            <th>desc: </th><td>"YYYY-MM-DD"</td><td>{1..50}</td><td>{1..50}</td><td>{1..50}</td><td>{1..50}</td><td>{1..50}</td><td>{1..12}</td><td>{1..12}</td>
        </tr>
    </body>
</table>

<br>

- **Attributes** - Furder describe an entity
  - Entity ```ej_row```
    - unique{ n1 < n2 < n3 < n4 < n5 }
    - each row is unique
    - from (1, 2, 3, 4, 5) to (46, 47, 48, 49, 50)
    - each row have unique `row_id`, as unique identification in relations with other entities


<style>
    table {
        font-size: 12px;
    }
</style>

<table >
    <header>
        <tr>
            <th>fields: </th><th>id</th><th>n1</th><th>n2</th><th>n3</th><th>n4</th><th>n5</th>
        </tr>
    </header>
    <body>
         <tr>
            <th>types: </th><td>integer(7)</td><td>integer(2)</td><td>integer(2)</td><td>integer(2)</td><td>integer(2)</td><td>integer(2)</td>
        </tr>
        <tr>
            <th>constraints: </th><td>Primary Key<br> unique <br>{1..2118760}</td><td>unique {n1..n5}</td><td>unique {n1..n5}</td><td>unique {n1..n5}</td><td>unique {n1..n5}</td><td>unique {n1..n5}</td>
        </tr>
        <tr>
            <th>desc: </th><td>{1..2118760}</td><td>{1..50}</td><td>{1..50}</td><td>{1..50}</td><td>{1..50}</td><td>{1..50}</td>
        </tr>
    </body>
</table>

<br>

- **Relationships** - Association among 2 or more entities

  - ```ej_draw``` - none yet
  - ```ej_row``` - none yet

![Euro Jackpot DB](assets/images/documentation/er-diagram.drawio.svg)

<br><br>
## Data Definition for MySQL and PostgreSQL

### Create Database `ej_lotto` on MySQL Server

With the same database name `ej_lotto`, user name `ej_lotto` and password `ej_lotto` on test server ;-)

```shell 
mysql_ej_lotto_001.sql
```

```SQL
-- Database `ej_lotto`
CREATE DATABASE  IF NOT EXISTS `ej_lotto` ;
USE `ej_lotto`;

-- Table `ej_draw`
DROP TABLE IF EXISTS `ej_draw`;
CREATE TABLE `ej_draw` (
  `date` date NOT NULL,
  `n1` int(2) NOT NULL,
  `n2` int(2) NOT NULL,
  `n3` int(2) NOT NULL,
  `n4` int(2) NOT NULL,
  `n5` int(2) NOT NULL,
  `en1` int(2) NOT NULL,
  `en2` int(2) NOT NULL,
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- INSERT TEST
INSERT INTO `ej_draw` (`date`, `n1`, `n2`, `n3`, `n4`, `n5`, `en1`, `en2` VALUES 
(now(), 1, 2, 3, 4, 5, 12, 11);

-- Table `ej_row`
DROP TABLE IF EXISTS `ej_row`;
CREATE TABLE `ej_row` (
  `row_id` int(7) NOT NULL AUTO_INCREMENT,
  `n1` int(2) NOT NULL,
  `n2` int(2) NOT NULL,
  `n3` int(2) NOT NULL,
  `n4` int(2) NOT NULL,
  `n5` int(2) NOT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
```


### Create Database `ej_lotto` on PostgreSQL Server

With the same database name `ej_lotto`, user name `ej_lotto` and password `ej_lotto` on test server ;-)

```BASH
pgsql_ej_lotto_001.sql
```

```SQL
-- Database `ej_lotto`
CREATE DATABASE  IF NOT EXISTS `ej_lotto` ;
USE `ej_lotto`;

-- Table `ej_draw`
DROP TABLE IF EXISTS `ej_draw`;
CREATE TABLE `ej_draw` (
  `date` date NOT NULL,
  `n1` int(2) NOT NULL,
  `n2` int(2) NOT NULL,
  `n3` int(2) NOT NULL,
  `n4` int(2) NOT NULL,
  `n5` int(2) NOT NULL,
  `en1` int(2) NOT NULL,
  `en2` int(2) NOT NULL,
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf-8;

-- Table `ej_row`
DROP TABLE IF EXISTS `ej_row`;
CREATE TABLE `ej_row` (
  `row_id` int(7) NOT NULL AUTO_INCREMENT,
  `n1` int(2) NOT NULL,
  `n2` int(2) NOT NULL,
  `n3` int(2) NOT NULL,
  `n4` int(2) NOT NULL,
  `n5` int(2) NOT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf-8;
```