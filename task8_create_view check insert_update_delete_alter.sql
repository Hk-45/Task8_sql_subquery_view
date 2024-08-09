select * from employee

select * from department


select e.first_name, avg(e.age) as "avg_age", avg(e.experience) as "avg_exp", avg(e.salary) as "avg_salary",
e.department_id, d.department_name, e.project_id, p.project_name from employee as e
inner join department as d
on e.department_id = d.department_id
inner join project as p
on e.project_id = p.project_id	
where d.location in ('New York', 'San Francisco')	
group by e.first_name, e.department_id, e.project_id, d.department_name, d.location, p.project_name, p.budget 
having avg(e.age) > 35 AND avg(e.salary) > 35000

--view table

create view emp_dept_project_info as
select e.first_name, avg(e.age) as "avg_age", avg(e.experience) as "avg_exp", avg(e.salary) as "avg_salary",
e.department_id, d.department_name, e.project_id, p.project_name from employee as e
inner join department as d
on e.department_id = d.department_id
inner join project as p
on e.project_id = p.project_id	
where d.location in ('New York', 'San Francisco')	
group by e.first_name, e.department_id, e.project_id, d.department_name, d.location, p.project_name, p.budget 
having avg(e.age) > 35 AND avg(e.salary) > 35000

select * from emp_dept_project_info

--insert is not work on view bcz view contain group by 

insert into emp_dept_project_info(first_name,avg_age,avg_exp,avg_salary,department_id,department_name,project_id,project_name)
values('update_new',38.00,5,32100,17,'new_dept',17,'new_proj')

--alter on view only update column name
alter view emp_dept_project_info rename column department_name to dept_name
	
alter view emp_dept_project_info rename column dept_name to department_name 

select * from emp_dept_project_info

--delete is not work bcz view contain group by 

delete from emp_dept_project_info where first_name = 'Jacob'

--update is not work bcz view contain group by 

update emp_dept_project_info set dept_name = 'IT' where department_id = 2 
 