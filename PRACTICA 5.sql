--practica v

--pregunta 1 seleccione el id desde los departamentos
--minus es lo primero que no esta en lo segundo
-- todos los departmentos donde no hay empleados con el id st_clerk
SELECT DEPARTMENT_ID FROM DEPARTMENTS
MINUS 
SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE JOB_ID = 'ST_CLERK'
ORDER BY DEPARTMENT_ID;

--PREGUNTA 2 LO QUE SE HACE ES QUE MINUS SI CONSIGUE UNA COINCIDENCIA NO LA MUESTRA
--A TODOS LOS PAISES LE RESTO LOS PAISES QUE YA TIENEN DEPARTAMENTO
--NATURAL JOIN BUSCA COINCIDENCIAS ENTRE CAMPOS
SELECT COUNTRY_ID, COUNTRY_NAME FROM COUNTRIES
MINUS
SELECT DISTINCT COUNTRY_ID, COUNTRY_NAME FROM COUNTRIES
NATURAL JOIN LOCATIONS NATURAL JOIN DEPARTMENTS;

--PREGUNTA 3
SELECT DISTINCT DEPARTMENT_ID, JOB_ID FROM EMPLOYEES WHERE DEPARTMENT_ID IN 
(SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE DEPARTMENT_ID=10
UNION
SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE DEPARTMENT_ID=50
UNION
SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE DEPARTMENT_ID=20)
ORDER BY (DECODE(DEPARTMENT_ID,50,15,DEPARTMENT_ID));

--PREGUTNA 4
SELECT J.*, E.HIRE_DATE "FECHA CONTRATO", E.JOB_ID "CARGO ACTUAL" 
FROM JOB_HISTORY J ,EMPLOYEES E WHERE J.EMPLOYEE_ID = E.EMPLOYEE_ID AND J.JOB_ID = E.JOB_ID /*AND 
 J.START_DATE  < E.HIRE_DATE*/;

SELECT JOB_ID, EMPLOYEE_ID FROM EMPLOYEES
INTERSECT
SELECT JOB_ID, EMPLOYEE_ID FROM JOB_HISTORY
ORDER BY EMPLOYEE_ID;
--PREGUNTA 5

SELECT LAST_NAME APELLIDO, TO_CHAR(NULL) NDEP, DEPARTMENT_ID FROM EMPLOYEES
UNION
SELECT TO_CHAR(NULL) APELLIDO, DEPARTMENT_NAME NDEP, DEPARTMENT_ID FROM DEPARTMENTS;

--CON JOINS
SELECT E.LAST_NAME, D.DEPARTMENT_NAME, E.DEPARTMENT_ID FROM EMPLOYEES E
FULL JOIN DEPARTMENTS D ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);
