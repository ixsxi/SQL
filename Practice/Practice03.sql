select em.employee_id,
       em.first_name,
       em.last_name,
       de.department_name
from employees em ,departments de
where em.department_id = de.department_id
order by de.department_name desc, em.employee_id asc;



select em.employee_id,
       em.first_name,
       em.salary,
       de.department_name,
       jo.job_title
       
from employees em , departments de , jobs jo
where em.department_id = de.department_id and em.job_id =jo.job_id
order by em.employee_id asc;

select em.employee_id,
       em.first_name,
       em.salary,
       de.department_name,
       jo.job_title
from employees em, departments de, jobs jo
where em.department_id = de.department_id and em.job_id = jo.job_id
order by jo.job_title, em.employee_id asc;



--2-1번
select em.employee_id,
       em.first_name,
       em.salary,
       de.department_name,
       jo.job_title

from employees em , departments de , jobs jo
where em.department_id = de.department_id (+)
and em.job_id = jo.job_id;




select lo.location_id,
        lo.city,
        de.department_name,
        de.department_id
from locations lo,departments de
where lo.location_id = de.location_id
order by lo.location_id asc;

--3-1
select lo.location_id,
        lo.city,
        de.department_name,
        de.department_id
from locations lo,departments de
where lo.location_id = de.location_id(+);

-- 4번
select re.region_name,
      co.country_name
from regions re , countries co
where co.region_id = re.region_id
order by re.region_id asc,co.country_name desc;

--5번
select em.hire_date,
    em.employee_id,
     em.first_name,
     ma.hire_date,
     ma.first_name
from employees em , employees ma
where em.manager_id = ma.employee_id
and em.hire_date <  ma.hire_date;

--6번
select co.country_name 나라명,
       co.country_id 나라아이디,
       lo.city 도시명,
       lo.location_id 도시아이디,
       de.department_name 부서명,
       de.department_id 부서아이디
from departments de , locations lo, countries co 
where de.location_id = lo.location_id and
lo.country_id = co.country_id
order by co.country_name asc;


--7번
select jo.job_id 업무아이디,
       em.employee_id 사번,
       em.first_name ||' '|| em.last_name 풀네임,
       jo.start_date 시작일,
       jo.end_date 종료일
from job_history jo ,  employees em
where em.employee_id = jo.employee_id and jo.job_id = 'AC_ACCOUNT';

--8번
select de.department_id 부서번호,
       de.department_name 부서이름,
       em.first_name 매니저이름,
       lo.city 도시,
       co.country_name 나라이름,
       re.region_name 지역이름
from departments de ,employees em ,locations lo,countries co,regions re
where de.manager_id = em.employee_id and
      de.location_id = lo.location_id and
      lo.country_id = co.country_id and
      co.region_id = re.region_id;
      
      --9 번
      
select em.employee_id 사번,
       em.first_name 이름,
       de.department_name 부서명,
       ma.first_name 매니저
from employees em left outer join departments de
on em.employee_id = de.department_id, employees ma
where em.manager_id = ma.employee_id;