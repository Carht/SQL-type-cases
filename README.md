# SQL-basic-cases
Some basic cases for SQL (MariaDB and PostgreSQL)

## Tips

### Consulting and change codification of a CSV file, before import to database, using shell Bash.

* Consulting the file codification.

```bash
file -i foo.csv
```

* Change (for example) from ISO-8859-1 (LATIN1: https://www.postgresql.org/docs/current/multibyte.html) TO UTF-8.

```bash
iconv -f ISO-8859-1 -t UTF-8//TRANSLIT input.csv -o outputf8.csv
```

## basic_setup_example_mariadb.sql
This script have the basic examples for this necessities:

* Create a table.
* Extract and insert using subquery.
* Alter table for add new columns.
* Update a column in the same table.
* Update a colum using another table.
* DROP a table.
* Rename a table.
* Trigger for update another table.
