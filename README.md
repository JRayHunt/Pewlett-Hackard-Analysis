# Pewlett-Hackard-Analysis
HR Analysis for future-proofing the company by determining how many people will be retiring and if there are enough senior employees to mentor new leaders.

## Challenge
The objective of this challenge was to help Pewlett Hackard evaluate the number of employees that would be retiring in each department and if there were enough senior employees eligible for mentorship programs to fill those roles.

## Results
1. Analysis of retiring employees by title shows that there is an overwhelming number of Senior Engineers, Senior Stafff and Engineers that will retire and need to be replaced. This means that the company should begin hiring and training engineering staff immediately to avoid these gaps. 

2. The good news is that very few managers are retiring. Therefore, some degree of leadership continuity can be expected.

3. The bad news is that there aren't any managers that qualify for the mentorship program.

4. The mentorship program qualification should be expanded to other senior employees that are slightly younger than the current qualifying age bracket.

## Summary
There will be 90,398 employees retiring. The number of employees retirng by title is as shown in this figure:

![Retiring_titles.PNG](/analysis/Retiring_titles.PNG)


There are 1549 employees that are eligible for a mentorship program. We need to evaluate this list by dept. By the figure below, we can see that there are only 529 qualifying senior engineers. We do not know what the ration requirement is for mentor to mentee, however, this seems alarmingly inadequate based on the need.
![mentorship_by_title.PNG](/analysis/mentorship_by_title.PNG)

Additionally, the salary of the retiring employees should be analysed more thouroughly to plan for the budget to replace these employees given today's salary expectations. To aid in this analysis we've generated average salary by title of retiring employees using this sql:

SELECT AVG(ei.salary), rt.title
FROM retirement_titles as rt
JOIN emp_info as ei
	ON ei.emp_no = rt.emp_no
Where ei.to_date >= '9999-01-01'
GROUP BY rt.title;

And generating this dataset: 
![avg_salary_by_title.PNG](/analysis/avg_salary_by_title.PNG)