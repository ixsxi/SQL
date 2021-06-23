-- from 절 select절
--모든 컬럼 조회하기
select *
from employees;

select *
from departments;


--원하는 컬럼(세로)만 조회하기
select employee_id, first_name, last_name
from employees;

select first_name, 
       last_name, 
       phone_number, 
       email, 
       hire_date
from employees;

--출력할 때 컬럼에 별명 사용하기
select employee_id as empno,
       first_name as "f-name",
       salary  as "급 여"
from employees;

--예제)

select first_name "이름",
       phone_number "전화번호",
       hire_date "입사일",
       salary "급여"
       
from employees;

select employee_id as 사원번호,
       first_name as 이름,
       last_name as 성,
       salary as 급여,
       phone_number as  전화번호,
       email as 이메일,
       hire_date as 입사일
       
from employees;



--연결 연산자로 컬럼들 붙이기

select first_name,
       last_name

from employees;

select first_name || last_name as 이름
from employees;

select first_name || ' hire date is ' || hire_date as "입사일"
from employees;

--산술 연산자 사용하기

select first_name,
       salary
from employees;


select first_name,
       salary,
       salary*12,
       (salary+300)*12
from employees;


select job_id*12

from employees;

--예제)
select first_name ||'-'|| last_name "성명",
       salary "급여",
       salary*12 "연봉",
       salary*12+5000 "연봉2",
       phone_number "전화번호"
from employees;



--where 절

select first_name
from employees
where department_id != 10;


select first_name,salary
from employees
where salary >=1500;


select first_name, hire_date
from employees
where hire_date >= '07/01/01';

select salary, first_name
from employees
where first_name = 'Lex';

select first_name, salary
from employees
where salary >= 14000 and salary <= 17000;

select *
from employees
where salary >= 14000 and salary <= 17000;


select first_name "이름",
       hire_date "입사일"
from employees
where hire_date >='04/01/01' and hire_date<='05/12/31';


--BETWEEN 연산자로 특정구간 값 출력하기
select *
from employees
where salary BETWEEN 14000 and 17000;

select first_name, last_name, salary
from employees
where first_name = 'Neena' or first_name = 'Lex' or first_name = 'John';

select first_name, last_name, salary
from employees
where first_name in ('Neena','Lex','John');



select first_name, salary
from employees
where salary in ('2100','3100','4100','5100');


select first_name, salary
from employees
where salary = 2100
or salary = 3100
or salary = 4100
or salary = 5100;

--Like 연산자로 비슷한것들 모두 찾기 
select first_name, last_name, salary
from employees
where first_name like '%l';

-------------
select first_name, salary
from employees
where first_name like '%am%';

select first_name, salary
from employees
where first_name like '_a%';

select first_name, salary
from employees
where first_name like '___a%';

select first_name, salary
from employees
where first_name like '__a_';