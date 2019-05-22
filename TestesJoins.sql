SELECT e1.first_name || ' ' || e1.last_name AS FULLNAME, 
  e2.first_name || ' ' || e2.last_name AS FULLNAME
  FROM employees e1 INNER JOIN employees2 e2 ON
 e1.employee_id = e2.employee_id;