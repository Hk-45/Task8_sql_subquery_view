select * from employee

select * from project
	
select * from department
	
--subquery with having
select (select p.project_name from project as p where p.project_id = e.project_id),
avg(e.salary) as "avg_salary", e.project_id	
from employee as e 
group by e.project_id
having avg(e.salary) > 40000 


select e.first_name, e.age, sum(e.experience) as "sum_exp", e.department_id,
(select d.department_name from department as d where d.department_id = e.department_id)	
from employee as e 
group by e.first_name, e.age, e.department_id 
having sum(e.experience) > 10