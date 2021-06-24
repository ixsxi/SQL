select *
from employees;



select first_name, salary, commission_pct
from employees
where commission_pct is null; -- 커미션들이 null인 애들 출력 

select first_name, salary, commission_pct
from employees
where commission_pct is not null;

-- 예제) 커미션 비율이 있는 사원의 이름과 연봉 커미션비율을 출력
select first_name, salary, commission_pct
from employees
where commission_pct is not null;

select first_name
from employees
where manager_id is null and commission_pct is null;

-- order by 절
select first_name, salary
from employees
order by salary desc; -- 내림차순



select first_name, salary
from employees
order by salary asc; -- 오름차순

select first_name, salary
from employees
order by salary asc, first_name asc;-- 오름차순

select first_name, salary
from employees
where salary >= 9000
order by salary desc;

select department_id, salary, first_name
from employees
order by department_id asc;

select first_name, salary
from employees
where salary>=10000
order by salary desc;

select department_id, salary, first_name
from employees
order by department_id asc, salary desc;

--단일행 함수 
select email, initcap(email), department_id
from employees
where department_id = 100;

--가상의 테이블 dual
select initcap('aaaa')
from dual;


select first_name, lower(first_name), upper(first_name)
from employees
where department_id = 100;

-- substr()

select substr('abcdefg', 3 , 2)
from dual;



select first_name, substr(first_name, 1, 3), substr(first_name, -3,2)
from employees
where department_id = 100;


-- LPAD() RPAD()
select  first_name,
       lpad(first_name, 10, '*'),
       rpad(first_name, 10, '*')
from employees;

--replace()
select first_name,
       replace(first_name, 'a', '*'),
       replace(first_name,  substr(first_name, 2, 3) ,'***')
from employees;

select first_name, substr(first_name, 2, 3)
from employees;


--숫자함수--
--round 반올림
select round(123.346, 2),
       round(123.546, 0),
       round(123.346, -1)
from dual;


--trunc 버림
select trunc(123.456,2),
       trunc(123.456,0),
       trunc(123.456, -1)
from dual;

--abs
select abs(-5)
from dual;

--날짜 함수
select sysdate
from dual;

select sysdate,
    hire_date,
    trunc(months_between(sysdate,hire_date),0)
from employees;


-- 변환 함수 -- 
 -- to_char()
 
 select first_name, salary*12, to_char (salary*12, '$999,999.99')
 from employees
where department_id = 110;


select to_char(9876, '99999'),
        to_char(9876, '099999'),
        to_char(9876, '$9999'),
        to_char(9876, '9999.99'),
        to_char(987654321, '999,999,999')
from dual;

--to char() 날짜 --> 문자열

select sysdate,
        to_char(sysdate, 'YY-MM-DD HH24:MI:ss' ),
        to_char(sysdate, 'YYYY'),
        to_char(sysdate, 'YY'),
        to_char(sysdate, 'MM'),
        to_char(sysdate, 'month'),
        to_char(sysdate, 'DD'),
        to_char(sysdate, 'Day'),
        to_char(sysdate, 'HH'),
        to_char(sysdate, 'HH24'),
        to_char(sysdate, 'YYMMDD')
from dual;

-- nvl() nvl2()
select first_name, 
        commission_pct,
        nvl(commission_pct, 0),
        nvl2(commission_pct, '값있음',0)
from employees