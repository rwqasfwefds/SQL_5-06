-- 서브쿼리(자식 쿼리) *****
-- SELECT 안에 또 다른 SELECT가 포함된 형태
-- 문법) SELECT 컬럼리스트
--      FROM 테이블명
--      WHERE 컬럼명 = (SELECT문);
-- 예) SCOTT과 동일한 부서에서 근무하는 사원 출력
-- = 서브쿼러 : 데이터 1건만 비교해야 함

-- 쿼리문을 2번 작성하니 ㅈㄴ 비효율
SELECT ENAME, DNO
FROM EMPLOYEE
WHERE DNO = 20;

-- 동일한 부서 검색
SELECT DNO FROM EMPLOYEE
WHERE ENAME = 'SCOTT';

-- 위와 동일한 결과를 도출해내는 쿼리문
SELECT ENAME, DNO
FROM EMPLOYEE
WHERE DNO = (SELECT DNO FROM EMPLOYEE
WHERE ENAME = 'SCOTT');

-- 문제 1) 최소 급여를 받는 사원의 이름, 담당업무, 급여 출력하기
SELECT ENAME, JOB, SALARY
FROM EMPLOYEE
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEE);

-- 메인 쿼리에 HAVING절 사용하기
SELECT DNO, MIN(SALARY) AS 최소급여
FROM EMPLOYEE
GROUP BY DNO
HAVING MIN(SALARY) > (SELECT MIN(SALARY) FROM EMPLOYEE WHERE DNO = 30);

-- 여러건 쓰는 서브쿼리
-- IN / EXISTS 연산자 비교
-- 둘 다 결과는 똑같은데 성능은 EXISTS가 훨 좋음(검색 속도가 훨 좋음)
-- IN : 메인쿼리의 비교 조건이 서브 쿼리의 결과 중에서 하나라도 일치하면 참
-- 조회순서 : 서브쿼리 먼저 실행 -> 메인쿼리 실행하면서 조건 비교
-- EXISTS : 메인쿼리의 비교 조건이 서브 쿼리의 결과 중에서 만족하는 값이 하나라도 존재하면 참
-- 조회순서 : 메인쿼리 먼저 실행 -> 서브쿼리를 조건 비교하다가 만족하면 BREAK 즉, 빠져나옴

-- 다중 행 서브쿼리
-- 예) (서브쿼리 문의 데이터가 총 3건이 나오니깐 다중 행 서브쿼리)
-- 여기선 서브쿼리 문에 MIN(SALARY)얘가 의미가 있음 왜? 얘랑 SALARY랑 비교하니깐
SELECT ENO, ENAME
FROM EMPLOYEE
WHERE SALARY IN (SELECT MIN(SALARY) FROM EMPLOYEE GROUP BY DNO);

-- EXISTS 사용 예)
-- EXISTS 서브쿼리 문에 1은 의미 없음 그냥 적어두는 거임 비교는 A.SALARY = MIN(SALARY)여기서 다 하기 때문에 ㅇㅇ
SELECT ENO, ENAME
FROM EMPLOYEE A
WHERE EXISTS (SELECT 1 FROM EMPLOYEE GROUP BY DNO HAVING A.SALARY = MIN(SALARY));
