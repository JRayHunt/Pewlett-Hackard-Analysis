SELECT e.emp_no,
		e.first_name,
		e.last_name,
		t.title,
		t.from_date,
		t.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles as t
ON t.emp_no = e.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT COUNT(DISTINCT(emp_no)), 
	title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT DISTINCT ON (t.emp_no)
		e.emp_no,
		e.first_name,
		e.last_name,
		e.birth_date,
		de.from_date,
		de.to_date,
		t.title
INTO mentorship_eligibility
FROM employees as e
JOIN dept_emp as de
ON de.emp_no = e.emp_no
JOIN titles as t
ON t.emp_no = e.emp_no
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY t.emp_no, t.to_date DESC;

-- Additional query to list number of mentorship program employees by title
SELECT COUNT(DISTINCT(emp_no)), 
	title
-- INTO mentoring_titles
FROM mentorship_eligibility
GROUP BY title
ORDER BY count DESC;

