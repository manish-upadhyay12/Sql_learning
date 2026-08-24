at the end of the all question notes is there to undeerstand where i mistake
/*
=============================== SQL Revision Test (Question 1/6) ===================================
===============================  =============================  ==================================
🟢 Question 1 (Medium)

The HR manager wants to find employees who satisfy all of the following conditions:

Department is IT, Finance, or HR
Salary is NOT between ₹55,000 and ₹80,000
Age is greater than or equal to 28
Email is not NULL
First name does not start with the letter S
Display only these columns:
employee_id
first_name
department
salary
age
email
Sort the result by:
Salary (Highest → Lowest)
*/
SELECT employee_id,
	   first_name,
	   department,
	   salary,
	   age,
	   email
FROM data_practice
WHERE department IN('IT','Finance','HR')
	  AND  salary NOT BETWEEN 55000 AND 80000
	  AND age >=28
	  AND Email IS NOT NULL
	  AND first_name NOT LIKE 'S%'
 ORDER BY salary desc ;

/*
 Question 2 –  Find employees whose:

first name contains the letter 'a' anywhere,

salary is NOT between 50,000 and 80,000,

department is not HR,

email is not NULL
Sort by first_name in ascending order order
salary in desc.
*/

SELECT employee_id,
	   first_name,
	   department,
	   salary,
	   age
FROM data_practice
WHERE first_name LIKE '%a%'
	   AND NOT Department = 'HR'
	    AND  not Email  is null
ORDER BY first_name  asc, salary desc,department asc;

/*
Question 3 – CASE WHEN with Dates

Display a new column named Joining_Status:

Joined in 2024 → 'Recent Hire'
Joined before 2022 → 'Experienced'
Otherwise → 'Regular'

Display:

first_name
joining_date
Joining_Status

after all only show recent hire column
*/
SELECT * FROM (
SELECT first_name,joining_date,
	 	CASE 
			WHEN YEAR(joining_date)= 2024   then  'Recent Hire'
			WHEN YEAR(joining_date)< 2022 then 'Experienced'
			ELSE 'Regular' 
		END as joining_status
  from data_practice
)t
WHERE joining_status = 'Recent Hire';

/*
Question 4 – Complex Filtering

Find employees who satisfy either of these conditions:

Age is between 22 and 30 AND department is Marketing
OR
Salary is greater than 95,000

Display:

first_name
department
age
salary
*/

SELECT  first_name,
	    department,
		age,
		salary
FROM data_practice
WHERE Age BETWEEN 22 AND 30 
	   AND Department = 'Marketing'
	   or salary >95000;

/*
Question 5 – UPDATE with Multiple Conditions

Increase salary by ₹3,000 only for employees who:

belong to Finance or HR, and
have a salary less than ₹60,000.
*/
UPDATE data_practice
SET salary = salary + 3000
WHERE Department = 'Finance' AND salary <60000;
SELECT * FROM data_practice;

/*
🟢 Question 6 — The HR department wants employees who satisfy either of these conditions:

Condition A
Department is IT AND 
Salary is greater than ₹85,000

OR

Condition B
Age is less than 25 AND 
Joining date is before 2023-01-01

Also,
Email must NOT be NULL.
Display
employee_id
first_name
department
salary
age
joining_date
Sort
Age (Youngest → Oldest)
*/
SELECT employee_id,
	   first_name,
	   department,
	   salary,
	   age,
	   joining_date
FROM data_practice
WHERE department = 'IT' AND salary >85000  -- condition -1
      OR age <25 AND  joining_date<'2023-01-01'  -- condition -1
	  OR  NOT Email  IS NULL  --condition -1
ORDER BY age asc ;


will do tomorrow
/*
🟡 Question 2 — Pattern Matching Challenge

Find employees whose:

First name starts with A, M, or R
Last name contains "son" OR "man"
Email does NOT end with @gmail.com
Department is NOT HR
Display
employee_id
first_name
last_name
email
department
Sort
First Name (A-Z)

*/
SELECT employee_id,




# 📘 SQL Learning Notes (Mistakes + Solutions + Rules)

---

# 1. CASE Statement in WHERE

## ❌ My Mistake

```sql
SELECT first_name, joining_date
FROM data_practice
WHERE
CASE
    WHEN joining_date BETWEEN '2024-01-01' AND '2024-12-01'
    THEN 'Recent Hire'
END AS joining_status;
```

## ❌ Error

* `CASE` cannot be used like this inside `WHERE`.
* `AS joining_status` is not allowed inside the `WHERE` clause.

## 🤔 Why?

`WHERE` only understands conditions that return **TRUE** or **FALSE**.

Example:

```sql
age > 20
```

returns TRUE/FALSE.

But this:

```sql
CASE
WHEN YEAR(joining_date)=2024 THEN 'Recent Hire'
END
```

returns **text**, not TRUE/FALSE.

That's why SQL gives an error.

---

## ✅ Correct Solution

```sql
SELECT
    first_name,
    joining_date,
    CASE
        WHEN YEAR(joining_date)=2024 THEN 'Recent Hire'
        WHEN YEAR(joining_date)<2022 THEN 'Experienced'
        ELSE 'Regular'
    END AS joining_status
FROM data_practice;
```

---

## ✅ Filter using Subquery

```sql
SELECT *
FROM
(
    SELECT
        first_name,
        joining_date,
        CASE
            WHEN YEAR(joining_date)=2024 THEN 'Recent Hire'
            WHEN YEAR(joining_date)<2022 THEN 'Experienced'
            ELSE 'Regular'
        END AS joining_status
    FROM data_practice
)t
WHERE joining_status='Recent Hire';
```

---

## 🧠 Rule to Remember

✅ CASE creates values.

✅ WHERE filters rows.

**Never create an alias inside WHERE.**

---

# 2. "Recent Hire" in WHERE

## ❓ My Question

Why are we writing

```sql
WHERE joining_status='Recent Hire'
```

instead of checking the date again?

---

## ✅ Answer

Because the subquery already created a new column.

Example

| first_name | joining_status |
| ---------- | -------------- |
| Aman       | Recent Hire    |
| Ravi       | Experienced    |
| Neha       | Regular        |

Now SQL simply checks

```sql
joining_status='Recent Hire'
```

instead of calculating the CASE expression again.

---

## 🧠 Rule

Create first.

Filter later.

---

# 3. YEAR() vs BETWEEN

## ❓ My Question

Can I write only the year instead of BETWEEN?

---

## ✅ Yes

```sql
WHERE YEAR(joining_date)=2024;
```

---

## Also Possible

```sql
WHERE joining_date
BETWEEN '2024-01-01'
AND '2024-12-31';
```

---

## Better Performance

```sql
WHERE joining_date>='2024-01-01'
AND joining_date<'2025-01-01';
```

---

## 🧠 Rule

Learning → `YEAR()` is easy.

Real projects → Date ranges are usually more efficient.

---

# 4. ORDER BY Multiple Columns

## ❓ My Question

How do I sort by Age, Department and First Name?

---

## ✅ Solution

```sql
ORDER BY age,
         department,
         first_name;
```

---

## SQL Works Like This

Priority 1

↓

Age

↓

Priority 2

Department

↓

Priority 3

First Name

---

## 🧠 Rule

SQL checks columns **from left to right**.

---

# 5. Department Didn't Sort

## ❌ My Query

```sql
ORDER BY
first_name,
salary DESC,
department;
```

---

## ❓ My Question

Why isn't department sorting?

---

## ✅ Answer

Because SQL first sorts by

```
first_name
```

Only if two rows have the same first name does it look at

```
salary
```

Only if both first name and salary are the same does it finally compare

```
department
```

So department has the **lowest priority** here.

---

## Example

Wrong expectation

```
Department will sort first.
```

Reality

```
First Name
↓

Salary

↓

Department
```

---

## Correct Query (if department should come first)

```sql
ORDER BY
department,
first_name,
salary DESC;
```

---

## 🧠 Rule

The **first column** in ORDER BY has the highest priority.

---

# 6. NOT Operator

## ❌ My Query

```sql
NOT department='HR'
```

---

## Better Way

```sql
department<>'HR'
```

Both work.

Second one is cleaner.

---

## 🧠 Rule

Prefer

```
<>
```

instead of

```
NOT =
```

---

# 7. NULL

## Wrong

```sql
email=NULL
```

or

```sql
email<>NULL
```

---

## Correct

```sql
email IS NULL
```

or

```sql
email IS NOT NULL
```

---

## 🧠 Rule

NULL is **not a value**.

Always use

```
IS NULL

or

IS NOT NULL
```

---

# 8. LIKE

Contains A

```sql
LIKE '%A%'
```

Starts with A

```sql
LIKE 'A%'
```

Ends with A

```sql
LIKE '%A'
```

Second Letter A

```sql
LIKE '_A%'
```

Exactly Five Letters

```sql
LIKE '_____'
```

---

## 🧠 Rule

```
%
```

means

Any number of characters

```
_
```

means

Exactly one character

---

# 9. SQL Execution Order

Many beginners think SQL runs like this:

```
SELECT

↓

FROM

↓

WHERE
```

❌ Wrong

---

Actual order

```
FROM

↓

WHERE

↓

GROUP BY

↓

HAVING

↓

SELECT

↓

ORDER BY

↓

LIMIT
```

---

## 🧠 Rule

Because `SELECT` runs after `WHERE`, aliases created in `SELECT` are **not available** in `WHERE`.

---

# ⭐ Common Mistakes to Avoid

❌ Using alias in WHERE

✔ Use subquery or repeat the condition.

---

❌ Thinking ORDER BY sorts every column equally

✔ SQL sorts left to right.

---

❌ Using `= NULL`

✔ Use `IS NULL`.

---

❌ Using CASE only for filtering

✔ CASE is mainly used to create a new value.

---

❌ Forgetting SQL execution order

✔ Remember:

```
FROM
↓

WHERE
↓

GROUP BY
↓

HAVING
↓

SELECT
↓

ORDER BY
↓

LIMIT
```

---

# 🚀 Personal Revision Checklist

Before writing a query, ask yourself:

* Is my WHERE condition returning TRUE/FALSE?
* Am I accidentally using a SELECT alias in WHERE?
* Is the ORDER BY priority correct?
* Am I using `IS NULL` instead of `= NULL`?
* Should I use `YEAR()` or a date range?
* Is CASE creating a value or am I trying to filter with it?
* Do I remember the SQL execution order?
