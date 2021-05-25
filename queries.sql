-- ================== Practices 1 solve ====================
-- ================== query 1 ============================
SELECT last_name, salary FROM employees
WHERE salary > 12000;
-- ================== query 2 ============================
SELECT LAST_NAME, DEPARTMENT_ID FROM employees
WHERE EMPLOYEE_ID > 176;
-- ================== query 3 ============================
-- == (a)
SELECT MAX(SALARY) , MIN(SALARY) FROM employees;
-- (b)
SELECT LAST_NAME, SALARY FROM employees
WHERE salary NOT BETWEEN 5000 AND 12000;
-- ================== query 4 ============================
SELECT LAST_NAME, JOB_ID , HIRE_DATE FROM employees
WHERE LAST_NAME = 'matos' OR LAST_NAME = 'taylor'
ORDER BY HIRE_DATE ASC;
-- ================== query 5 ============================
SELECT LAST_NAME,DEPARTMENT_ID FROM employees
WHERE DEPARTMENT_ID IN(20 , 50)
ORDER BY LAST_NAME ASC;
-- ================== query 6 ============================
SELECT LAST_NAME AS 'NAME', SALARY as 'Monthly Salary' FROM employees
WHERE SALARY BETWEEN 5000 AND 12000
AND DEPARTMENT_ID IN (20, 50);
-- ================== query 7 ============================
SELECT LAST_NAME , HIRE_DATE FROM employees
-- 1994 zero row  
WHERE HIRE_DATE LIKE '2006%';
-- ================== query 8 ============================
SELECT LAST_NAME , JOB_ID FROM employees
WHERE MANAGER_ID IS null;
-- ================== query 9 ============================
SELECT LAST_NAME , SALARY,COMMISSION_PCT  FROM employees
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY SALARY DESC , COMMISSION_PCT DESC;
-- ==========================================================
-- ================== Practices 2 solve =====================
-- ================== query 1 ===============================
SELECT CURRENT_DATE 'Date';
-- ================== query 2 ===============================
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, (SALARY * 1.155) New_salary FROM employees;
-- ================== query 3 ===============================
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, (SALARY * 1.155) as 'New salary',
ROUND(((SALARY * 1.155) - SALARY)) AS 'increase' FROM employees;
-- ================== query 4 ===============================
SELECT concat(upper(LEFT(LAST_NAME,1)), substring(LAST_NAME, 2)) FROM employees;
-- ========== (a) ===========
SELECT concat(upper(LEFT(LAST_NAME,1)), substring(LAST_NAME, 2)) AS 'name' , char_length(LAST_NAME) length FROM employees
WHERE LAST_NAME LIKE 'a%' OR
LAST_NAME LIKE 'j%' OR
LAST_NAME LIKE 'm%';
-- ========== (b) ============
SELECT concat(upper(LEFT(LAST_NAME,1)), substring(LAST_NAME, 2)) AS 'name' , char_length(LAST_NAME) length FROM employees
WHERE LAST_NAME LIKE 'h%';
-- ================== query 5 ===============================
SELECT LAST_NAME, HIRE_DATE , ROUND((datediff(now(), HIRE_DATE)) / 30) as 'worked monthes' FROM employees;
-- ================== query 6 ===============================
SELECT LAST_NAME, LPAD(SALARY, 15, "&&&&&&&") SALARY FROM employees;
-- ================== query 7 ===============================
-- ??????????????
-- ==========================================================
-- ================== Practices 3 solve =====================
-- ================== query 1, 2, 3 =========================
-- 1- true
-- 2- false
-- 3- true
-- ================== query 4 ===============================
SELECT round(MAX(SALARY)) 'maximum', round(MIN(SALARY)) 'minimum',
 round(SUM(SALARY)) 'sum', round(AVG(SALARY)) 'avarage' FROM employees;
-- ================== query 5 ===============================
SELECT JOB_ID ,round(MAX(SALARY)) 'maximum', round(MIN(SALARY)) 'minimum',
 round(SUM(SALARY)) 'sum', round(AVG(SALARY)) 'avarage' FROM employees
 GROUP BY JOB_ID;
-- ================== query 6 ===============================
SELECT JOB_ID , count(EMPLOYEE_ID) FROM employees
GROUP BY JOB_ID;
-- ================== query 7 ===============================
SELECT COUNT( DISTINCT MANAGER_ID) 'number of managers' FROM employees;
-- ================== query 8 ===============================
SELECT (MAX(SALARY) - MIN(SALARY)) 'DIFFERENCE' FROM employees;
-- ================== query 9 ===============================
SELECT MANAGER_ID, COUNT(MANAGER_ID), MIN(SALARY) min_salary FROM employees
GROUP BY MANAGER_ID
HAVING MANAGER_ID IS NOT null
AND min_salary > 6000
ORDER BY MIN(SALARY) DESC;
-- ==========================================================
-- ================== Practices 4 solve ====================
-- ================== query 1 ===============================
SELECT LOCATION_ID, STREET_ADDRESS, CITY, STATE_PROVINCE, COUNTRY_NAME FROM locations
JOIN countries
ON locations.COUNTRY_ID = countries.COUNTRY_ID;
-- ================== query 2 ===============================
SELECT LAST_NAME, employees.department_id, department_name FROM employees JOIN departments
ON employees.DEPARTMENT_ID = departments.DEPARTMENT_ID;
-- ================== query 3 ===============================
SELECT LAST_NAME, JOB_ID, employees.DEPARTMENT_ID, DEPARTMENT_NAME FROM
employees JOIN departments 
using (DEPARTMENT_ID)
JOIN locations using(LOCATION_ID)
WHERE CITY = 'Toronto'
-- ================== query 4 ===============================
SELECT emp.LAST_NAME employee, emp.EMPLOYEE_ID 'emp#' , mang.LAST_NAME manager, mang.EMPLOYEE_ID 'mang#' FROM
employees emp JOIN employees mang
ON emp.MANAGER_ID = mang.EMPLOYEE_ID;
-- ================== query 5 ===============================
SELECT emp.LAST_NAME employee, emp.EMPLOYEE_ID 'emp#' , mang.LAST_NAME manager, mang.EMPLOYEE_ID 'mang#' FROM
employees emp left JOIN employees mang
ON emp.MANAGER_ID = mang.EMPLOYEE_ID
ORDER BY emp.EMPLOYEE_ID;
-- ==========================================================
-- ================== Practices 5 solve =====================
-- ================== query 1 ===============================
SELECT EMPLOYEE_ID, LAST_NAME, SALARY FROM employees
WHERE SALARY > (SELECT AVG(SALARY) FROM employees)
ORDER BY SALARY ASC;
-- ================== query 2 ===============================
SELECT EMPLOYEE_ID, LAST_NAME FROM employees
WHERE DEPARTMENT_ID IN
( (SELECT DEPARTMENT_ID FROM employees
WHERE LAST_NAME LIKE '%u%'));
-- ================== query 3 ===============================
SELECT LAST_NAME, employees.DEPARTMENT_ID, JOB_ID FROM employees JOIN departments
USING (DEPARTMENT_ID)
WHERE departments.LOCATION_ID = 1700;
-- ================== query 4 ===============================
SELECT LAST_NAME, SALARY FROM employees
WHERE MANAGER_ID in (
SELECT MANAGER_ID FROM employees
WHERE MANAGER_ID = 100);
-- ================== query 5 ===============================
SELECT LAST_NAME, SALARY FROM employees JOIN departments
USING (DEPARTMENT_ID)
WHERE departments.DEPARTMENT_NAME = 'Executive';
-- ================== query 6 ===============================
SELECT EMPLOYEE_ID ,LAST_NAME, SALARY FROM employees
WHERE DEPARTMENT_ID IN ((
    SELECT DEPARTMENT_ID FROM employees JOIN departments
    USING (DEPARTMENT_ID)
    WHERE LAST_NAME LIKE '%u%' 
))
AND SALARY > (SELECT AVG(SALARY) FROM employees);





