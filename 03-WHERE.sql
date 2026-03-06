USE EMPLOYEES;
SELECT * FROM employees;

SELECT name,age FROM employees
WHERE age >30 ;

SELECT * FROM employees
WHERE AGE > 30 AND department='Sales';

SELECT * FROM employees
WHERE department='Sales' or department='HR';

SELECT * FROM employees
WHERE name like 'S%';

SELECT * FROM employees
WHERE name like '%S%';

SELECT * FROM employees
WHERE name like '%p';

SELECT * FROM EMPLOYEES WHERE department is not null and age is not null;

SELECT * FROM employees WHERE department IN ('Sales','HR');

SELECT * FROM employees WHERE department not IN ('Sales','HR');


