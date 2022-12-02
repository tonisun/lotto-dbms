# Lotto - Database Management System
![Logo egosanto.de](assets/images/documentation/logo.png)
<br><br>
## Data Models Development

- **Entities** - Represent real world object or concept
  - Euro Jackpot Draws ```{ data_base_name: "ej_draws", API_name: "EuroJackpotDraws" }```
  - All Euro Jackpot Rows ```{ data_base_name: "ej_all_rows", API_name: "EuroJackpotAllRows" }```
  <br>

  - 6 from 49 Draws ```{ ... }```
  - All 6 from 49 Rows ```{ ... }```
  <br>
  
  - ... ```{ ... }```

<br>

$$
f(x) = \int_{-\infty}^\infty
	\hat f(\xi)\,e^{2 \pi i \xi x}
	\,d\xi
$$

- **Attributes** - Furder describe an entity
Entity ```ej_draws```

<style>
    table {
        font-size: 12px;
    }
</style>

<font size="6">
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
</font>
<br>

- **Relationships** - Association among 2 or more entities

```ej_draws``` - none yet

<br><br>
## Data Definition for MySQL and PostgreSQL
