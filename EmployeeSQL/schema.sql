CREATE TABLE Titles (
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	PRIMARY KEY (title_id));
	
SELECT * from titles;

CREATE TABLE Employee (
	emp_no INTEGER NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) references titles (title_id));
	
SELECT * from Employee;

CREATE TABLE Salaries (
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) references Employee (emp_no));
	
SELECT * from Salaries;

CREATE TABLE Departments (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no));
	
SELECT * from Departments;

CREATE TABLE Department_Employees (
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) references Employee(emp_no),
	FOREIGN KEY (dept_no) references Departments (dept_no),
	PRIMARY KEY (emp_no, dept_no));
	
SELECT * from Department_Employees;

CREATE TABLE Department_Managers (
	dept_no VARCHAR NOT NULL,
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) references Employee(emp_no),
	FOREIGN KEY (dept_no) references Departments (dept_no));
	
SELECT * from Department_Managers;

SELECT Emp.emp_no, Emp.first_name, Emp.last_name, Emp.sex, salary.salary
from Employee as Emp
LEFT JOIN salaries as salary on (Emp.emp_no=salary.emp_no)
ORDER BY Emp.emp_no;

SELECT first_name, last_name, hire_date from employee
where hire_date between '1986-01-01' and '1986-12-31';

SELECT departments.dept_no, departments.dept_name, department_managers.emp_no, Employee.last_name, Employee.first_name
FROM departments JOIN department_managers on departments.dept_no=department_managers.dept_no
JOIN Employee on department_managers.emp_no=Employee.emp_no;

SELECT department_employees.emp_no, employee.last_name, employee.first_name, departments.dept_name
FROM department_employees JOIN employee ON department_employees.emp_no = employee.emp_no
JOIN departments ON department_employees.dept_no = departments.dept_no;

SELECT first_name, last_name FROM employee WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

SELECT department_employees.emp_no, employee.last_name, employee.first_name, departments.dept_name
FROM department_employees JOIN employee ON department_employees.emp_no = employee.emp_no
JOIN departments ON department_employees.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

SELECT department_employees.emp_no, employee.last_name, employee.first_name, departments.dept_name
FROM department_employees JOIN employee ON department_employees.emp_no = employee.emp_no
JOIN departments ON department_employees.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name='Development';

SELECT last_name, COUNT(last_name) AS "frequency"
FROM employee GROUP BY last_name ORDER BY COUNT(last_name) DESC;
