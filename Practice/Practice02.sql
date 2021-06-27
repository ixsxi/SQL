--문제 1. 
--전체직원의 다음 정보를 조회하세요. 
--정렬은 입사일(hire_date)의 올림차순(ASC)으로 가장 선임부터 출력이 되도록 하세요. 
--이름(first_name last_name),  월급(salary),  전화번호(phone_number), 입사일(hire_date) 순서이고 “이름”, “월급”, “전화번호”, “입사일” 로 컬럼이름을 대체해 보세요.

--연봉(salary)의 합계가 20000 이상인 부서의 부서 번호와 , 인원수, 급여합계를 출력하세요

select count(manager_id) "haveMngCnt"
from employees;


select max(salary) 최고임금 ,
       min(salary) 최저임금 ,
       max(salary) - min(salary) "최고임금-최저임금"
from employees;


select to_char(max(hire_date), 'YYYY"년" MM"월" DD"일"' )        
from employees;

select department_id 부서,
       avg(salary) 평균임금,
       max(salary) 최고임금,
       min(salary) 최저임금      
from employees
group by department_id
order by department_id desc;

select   job_id,
       round(avg(salary),0) 평균임금,
       max(salary) 최고임금,
       min(salary) 최저임금
       
from employees
group by job_id
order by min(salary) desc , round(avg(salary)) asc;


select to_char(min(hire_date), 'YYYY-MM-DD DAY')
from employees;

----------------************de******************---------
select  department_id, 
        avg(salary),
         min(salary),
         avg(salary) - min(salary)
from employees
group by department_id -- group 안하고 where 로 는 왜안되는가 
having avg(salary) - min(salary) <2000
order by avg(salary) - min(salary) desc;



select job_id,
        max(salary),
        min(salary),
        max(salary) - min(salary)
from employees
group by job_id
order by max(salary) - min(salary) desc;

/*
select  max(max_salary),
        min(min_salary),
        max(max_salary)-min(min_salary)
from jobs
group by job_id
order by max(max_salary)-min(min_salary) desc;
*/



--2005년 이후 입사자중 관리자별로 평균급여 최소급여 최대급여를 알아보려고 한다.
--출력은 관리자별로 평균급여가 5000이상 중에 평균급여 최소급여 최대급여를 출력합니다.
--평균급여의 내림차순으로 정렬하고 평균급여는 소수점 첫째짜리에서 반올림 하여 출력합니다.

select manager_id,
       round(avg(salary),0),
       min(salary),
       max(salary)
from employees
where hire_date > '2004-12-31'
group by manager_id
having avg(salary) >=5000
order by avg(salary) desc;

-- 혹시 해빙은 그룹함수 ?? 

select 
       first_name,hire_date,
        case when hire_date < '02/12/31' then '창립멤버'
             when hire_date < '03/12/31' then '03입사'
             when hire_date < '03/12/31' then '04입사'
             else '상장이후 입사' end "optDate"
from employees
order by hire_date asc;