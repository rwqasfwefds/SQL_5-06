-- ��������(�ڽ� ����) *****
-- SELECT �ȿ� �� �ٸ� SELECT�� ���Ե� ����
-- ����) SELECT �÷�����Ʈ
--      FROM ���̺��
--      WHERE �÷��� = (SELECT��);
-- ��) SCOTT�� ������ �μ����� �ٹ��ϴ� ��� ���
-- = �������� : ������ 1�Ǹ� ���ؾ� ��

-- �������� 2�� �ۼ��ϴ� ���� ��ȿ��
SELECT ENAME, DNO
FROM EMPLOYEE
WHERE DNO = 20;

-- ������ �μ� �˻�
SELECT DNO FROM EMPLOYEE
WHERE ENAME = 'SCOTT';

-- ���� ������ ����� �����س��� ������
SELECT ENAME, DNO
FROM EMPLOYEE
WHERE DNO = (SELECT DNO FROM EMPLOYEE
WHERE ENAME = 'SCOTT');

-- ���� 1) �ּ� �޿��� �޴� ����� �̸�, ������, �޿� ����ϱ�
SELECT ENAME, JOB, SALARY
FROM EMPLOYEE
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEE);

-- ���� ������ HAVING�� ����ϱ�
SELECT DNO, MIN(SALARY) AS �ּұ޿�
FROM EMPLOYEE
GROUP BY DNO
HAVING MIN(SALARY) > (SELECT MIN(SALARY) FROM EMPLOYEE WHERE DNO = 30);

-- ������ ���� ��������
-- IN / EXISTS ������ ��
-- �� �� ����� �Ȱ����� ������ EXISTS�� �� ����(�˻� �ӵ��� �� ����)
-- IN : ���������� �� ������ ���� ������ ��� �߿��� �ϳ��� ��ġ�ϸ� ��
-- ��ȸ���� : �������� ���� ���� -> �������� �����ϸ鼭 ���� ��
-- EXISTS : ���������� �� ������ ���� ������ ��� �߿��� �����ϴ� ���� �ϳ��� �����ϸ� ��
-- ��ȸ���� : �������� ���� ���� -> ���������� ���� ���ϴٰ� �����ϸ� BREAK ��, ��������

-- ���� �� ��������
-- ��) (�������� ���� �����Ͱ� �� 3���� �����ϱ� ���� �� ��������)
-- ���⼱ �������� ���� MIN(SALARY)�갡 �ǹ̰� ���� ��? ��� SALARY�� ���ϴϱ�
SELECT ENO, ENAME
FROM EMPLOYEE
WHERE SALARY IN (SELECT MIN(SALARY) FROM EMPLOYEE GROUP BY DNO);

-- EXISTS ��� ��)
-- EXISTS �������� ���� 1�� �ǹ� ���� �׳� ����δ� ���� �񱳴� A.SALARY = MIN(SALARY)���⼭ �� �ϱ� ������ ����
SELECT ENO, ENAME
FROM EMPLOYEE A
WHERE EXISTS (SELECT 1 FROM EMPLOYEE GROUP BY DNO HAVING A.SALARY = MIN(SALARY));
