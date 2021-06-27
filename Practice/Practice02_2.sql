select count(manager_id) "haveMngCnt"
from employees;



select max(salary) 최고임금,
       min(salary) 최저임금,
       max(salary) - min(salary) "최고임금-최저임금"
from employees;



select to_char(max(hire_date),'YYYY"년"MM"월"DD"일"')
from employees;

select replace(hire_date, '/','.')
from employees;


select avg(salary),
       max(salary),
       min(salary),
       department_id
from employees
group by department_id
order by department_id desc;




select round(avg(salary),0),
       max(salary),
       min(salary),
       job_id
from employees
group by job_id
order by min(salary) desc , avg(salary) asc; 



select to_char(min(hire_date), 'YYYY"-"MM"-"DD"-"DAY')
from employees;


select avg(salary),
       min(salary),
       department_id,
       avg(salary) - min(salary)
from employees
group by department_id
having avg(salary) - min(salary) < 2000
order by avg(salary) - min(salary) desc;


select job_id,
       max(salary),
       min(salary),
        max(salary)-min(salary)
from employees
group by job_id
order by max(salary)-min(salary) desc;


select round(avg(salary),0),
       min(salary),
       max(salary),
       manager_id
from employees
where hire_date > '2004-12-31'
group by manager_id
having avg(salary) >=5000
order by avg(salary) desc;

-- when( 컬럼, 조건) then (출력)
select first_name,
       hire_date,
    case 
       when hire_date <'02/12/31' then '창립멤버'
       when hire_date <'03/12/31' then '03입사'
       when hire_date <'04/12/31' then '04입사'
       else '상장이후입사' end "optDate"
from employees
order by hire_date;