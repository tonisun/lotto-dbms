# Lotto - Database Management System
![Logo egosanto.de](assets/images/documentation/logo.png)
<br><br>
## Data Description on `kaggle.com`
- EuroJackpot [Kaggle => 5 from 50](https://www.kaggle.com/code/tonisun/5from50)

$$ \binom{50}{5} = 2.118.760$$

- Euro Jackpot * 2 EuroNumbers(1..12)

$$ \binom{50}{5} * \binom{12}{2} = 2.118.760 * 24 = 50.850.240$$

- 6 from 49 * 1 SuperZahl(0..9)  

$$ \binom{49}{6} * \binom{10}{1} = 13.983.816  *  10 = 139.838.160 $$

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

<style>
    table {
        font-size: 12px;
    }
</style>

<table >
    <header>
        <tr>
            <th>fields: </th><th>id</th><th>n1</th><th>n2</th><th>n3</th><th>n4</th><th>n5</th><th>en1</th><th>en2</th>
        </tr>
    </header>
    <body>
         <tr>
            <th>types: </th><td>integer(7)</td><td>integer(2)</td><td>integer(2)</td><td>integer(2)</td><td>integer(2)</td><td>integer(2)</td><td>integer(2)</td><td>integer(2)</td>
        </tr>
        <tr>
            <th>constraints: </th><td>Primary Key<br> unique <br>{1..2118760}</td><td>unique {n1..n5}</td><td>unique {n1..n5}</td><td>unique {n1..n5}</td><td>unique {n1..n5}</td><td>unique {n1..n5}</td><td>unique {en1, en2}</td><td>unique {en1, en2}</td>
        </tr>
        <tr>
            <th>desc: </th><td>{1..2118760}</td><td>{1..50}</td><td>{1..50}</td><td>{1..50}</td><td>{1..50}</td><td>{1..50}</td><td>{1..12}</td><td>{1..12}</td>
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
