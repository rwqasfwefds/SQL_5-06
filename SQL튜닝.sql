-- SQL Ʃ��
-- SQL ����Ǵ� ����
-- 1��) FROM EMPLOYEE
-- 2��) WHERE ENO = 7788 (�����ϸ� �̰��� ������ �ż� �ӵ��� ���� ���� �Ŵ°� ����)
-- 3��) GROUP BY DNO
-- 4��) HAVING ��
-- 5��) SELECT DNO
-- 6��) ORDER BY(��ȸ �ӵ� ����)
SELECT DNO
FROM EMPLOYEE
WHERE ENO = 7788
GROUP BY DNO
ORDER BY DNO;

-- �ǻ� �÷� : ROWNUM
SELECT ROWNUM
FROM EMPLOYEE;
