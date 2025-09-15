# 📘 SQL Queries

## 📄 Description — Exercise Statement

This repository contains **two query-focused exercises** written for MySQL:

### 1) Store Database
You are given two tables:

- **producto** (`codigo`, `nombre`, `precio`, `codigo_fabricante`)  
- **fabricante** (`codigo`, `nombre`)

You must write queries that produce the following results:
1. Names of all products.  
2. Names and prices of all products.  
3. All columns of `producto`.  
4. Name, price in EUR and USD.  
5. Same as (4) with aliases: `product_name`, `euros`, `dollars`.  
6. Names and prices with product names in **upper** case.  
7. Names and prices with product names in **lower** case.  
8. Manufacturers in one column and the **first two letters (uppercased)** in another.  
9. Names and prices with **rounded** price.  
10. Names and prices with **truncated** price (no decimals).  
11. Manufacturer codes that have products.  
12. Same as (11) **without duplicates**.  
13. Manufacturer names sorted **ascending**.  
14. Manufacturer names sorted **descending**.  
15. Product names **ordered** by name (ASC) then price (DESC).  
16. **First 5** rows of `fabricante`.  
17. **2 rows starting from the 4th** row of `fabricante` (inclusive).  
18. **Cheapest** product (name, price) using only `ORDER BY` + `LIMIT`.  
19. **Most expensive** product (name, price) using only `ORDER BY` + `LIMIT`.  
20. All product names from manufacturer with code **= 2**.  
21. Product name, price, and **manufacturer name** for all products.  
22. Same as (21) **ordered by manufacturer name**.  
23. Product code, product name, manufacturer code, manufacturer name (for all products).  
24. Product name, price, manufacturer name of the **cheapest** product.  
25. Product name, price, manufacturer name of the **most expensive** product.  
26. All products by manufacturer **Lenovo**.  
27. All products by **Crucial** with price **> 200 €**.  
28. All products by **Asus**, **Hewlett-Packard**, **Seagate** (without `IN`).  
29. Same as (28) **using `IN`**.  
30. Name+price of all products whose manufacturer name **ends with ‘e’**.  
31. Name+price of all products whose manufacturer name **contains ‘w’**.  
32. Product name, price, manufacturer name where price **≥ 180 €**; order by **price DESC**, then **name ASC**.  
33. Manufacturer **code and name** only for manufacturers **with products**.  
34. **All manufacturers** with their products, including those with **no products**.  
35. **Only manufacturers with no products**.  
36. All products of **Lenovo** *(without INNER JOIN)*.  
37. All product rows whose price **equals Lenovo’s most expensive** *(no INNER JOIN)*.  
38. Name of **Lenovo’s most expensive** product.  
39. Name of **HP’s cheapest** product.  
40. All products priced **≥ Lenovo’s most expensive** product.  
41. All **Asus** products priced **above Asus’s average**.

---

### 2) University Database
Use the provided `schema_universidad.sql`. Explore the ER diagram and write queries for:

1. **Students (alphabetical)**
   - Return: *first surname*, *second surname*, *first name*.
   - Sort: `first_surname ASC, second_surname ASC, first_name ASC`.

2. **Students without phone**
   - Return: *first name* and *both surnames* of students **without a phone number** registered.

3. **Students born in 1999**
   - Return the list of students whose **birth year = 1999**.

4. **Professors without phone and NIF ending in ‘K’**
   - Return the list of professors who **have no phone** and whose **NIF ends with ‘K’**.

5. **Subjects — Q1, Year 3, Degree id = 7**
   - Return the subjects taught in **first semester**, **third year**, for the **degree with id = 7**.

6. **Professors with department**
   - Return **four columns**: *first surname*, *second surname*, *first name*, *department name*.
   - Sort ascending by surnames and first name.

7. **Subjects and school years for a specific student**
   - Return: *subject name*, *start year*, *end year* of the school year for the **student with NIF `26902806M`**.

8. **Departments teaching Computer Engineering (Plan 2015)**
   - Return the **names of departments** that have professors who teach **any subject** in the **Computer Engineering degree (Plan 2015)**.

9. **Students enrolled in 2018/2019**
   - Return all **students** who enrolled in **any subject** during the **2018/2019** academic year.


#### Use `LEFT JOIN` / `RIGHT JOIN` for the next six queries:

1. **Professors and their departments (include unassigned)**
    - Return **four columns**: *department name*, *first surname*, *second surname*, *first name*.
    - Include professors **with no department**.
    - Sort: department name, surnames, first name (all ascending).

2. **Professors without department**
    - Return the list of professors **not associated** with any department.

3. **Departments without professors**
    - Return the list of departments that **have no professors** associated.

4. **Professors without subjects**
    - Return the list of professors who **do not teach** any subject.

5. **Subjects without an assigned professor**
    - Return the list of subjects that **have no professor** assigned.

6. **Departments that never taught**
    - Return the list of departments that **have not taught** subjects in **any** academic year.


#### Summary / Aggregate queries:

1. **Total number of students**
    - Return a single count of all students.

2. **Students born in 1999 (count)**
    - Return how many students were born in **1999**.

3. **Professors per department (only non-empty, sorted)**
    - Return **two columns**: *department name*, *number of professors*.
    - Include **only** departments that **have professors**.
    - Sort **descending** by the number of professors.

4. **All departments with professor counts (including zero)**
    - Return **all departments** and the **number of professors** in each, including those with **zero**.

5. **Degrees with number of subjects (including zero)**
    - Return *degree name* and *subject count* for **all degrees**, including those with **no subjects**.
    - Sort **descending** by subject count.

6. **Degrees with more than 40 subjects**
    - Return *degree name* and *subject count* for degrees that have **> 40** subjects.

7. **Credits per subject type by degree**
    - Return **three columns**: *degree name*, *subject type*, **sum of credits** for that type in that degree.

8. **Enrollments per academic year**
    - Return **two columns**: *academic year start year*, *number of enrolled students* (students enrolled in any subject in that year).

9. **Subjects taught per professor (including zero)**
    - Return **five columns**: *professor id*, *first name*, *first surname*, *second surname*, *number of subjects taught*.
    - Include professors with **zero** subjects.
    - Sort **descending** by the number of subjects.

10. **Youngest student**
    - Return **all columns** for the **youngest** student.

11. **Professors with a department but no subjects**
    - Return the list of professors who **have a department assigned** and **do not teach** any subject.


---

## 💻 Technologies Used
- **MySQL 8.0+**
- **MySQL CLI** or **MySQL Workbench**
- Docker
- Git & GitHub

---

## 📋 Requirements
- MySQL **8.0 or newer**
- MySQL Workbench or another SQL client
- Text/code editor
- Git for version control

---

## 🛠️ Installation
1. **Clone** the repository:
   ```bash
   git clone https://github.com/alaw810/2.2-Databases-MySQL-Queries
   ```
2. Open the project folder.

3. Open the `.sql` files using your SQL client.

4. Run the schema scripts.


---

## ▶️ Execution

- Execute MySQL Workbench or your preferred MySQL client.

- After the installation you only need to run the `.sql` files with the queries.

---

## 🌐 Deployment
This project is designed for local execution only. No online or production deployment is required.

