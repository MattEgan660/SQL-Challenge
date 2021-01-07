
--DATA ANLAYSIS--

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name",
		e.sex as "Sex", s.salary as "Salary"
FROM employees e
JOIN salaries s
ON (e.emp_no = s.emp_no);

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.emp_no as "Employee Number", e.last_name as "Last Name",
	   e.first_name as "First Name", e.hire_date as "Hire Date"
FROM employees e
WHERE e.hire_date > '1985-12-31' AND e.hire_date <'1987-01-01'
ORDER BY e.hire_date;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no as "Department Number", d.dept_name as "Department Name", m.emp_no as "Manager Employee Number",
       e.last_name as "Last Name", e.first_name as "First Name", m.from_date as "Start Date", m.to_date as "End Date"
FROM dept_manager m
JOIN departments d ON (d.dept_no = m.dept_manager)
JOIN employees e ON (e.emp_no = m.emp_no);

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no as "Employee Number", e.last_name as "Last Name",
	   e.first_name as "First Name",d.dept_name as "Department Name"
FROM dept_emp de
JOIN departments d on (d.dept_no = de.dept_no)
JOIN employees e on (e.emp_no = de.emp_no);

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT  e.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name"
FROM employees e
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no as "Employee Number", e.last_name as "Last Name",
	   e.first_name as "First Name", d.dept_name as "Department Name"
FROM dept_emp de
JOIN departments d on (d.dept_no = de.dept_no)
JOIN employees e on (e.emp_no = de.emp_no)
WHERE d.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no as "Employee Number", e.last_name as "Last Name",
	   e.first_name as "First Name", d.dept_name as "Department Name"
FROM dept_emp de
JOIN departments d on (d.dept_no = de.dept_no)
JOIN employees e on (e.emp_no = de.emp_no)
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name as "Last Name", count(last_name) as "Frequency Counts"
FROM employees
GROUP BY last_name
ORDER BY "Frequency Counts" DESC;