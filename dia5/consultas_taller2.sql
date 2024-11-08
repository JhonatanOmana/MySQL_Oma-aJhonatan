use universidad_t2;
select apellido1,apellido2,nombre from alumno 
order by 1,2,3 asc;

select nombre,apellido1,apellido2 
from alumno 
where telefono is null;

select * from asignatura where cuatrimestre =1
and curso = 3 and id_grado=7;


select asignatura.nombre from asignatura
inner join grado on asignatura.id_grado = grado.id
where grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

select * from asignatura, grado where grado.id= 4;

select * from asignatura,grado,alumno where nombre = '';

select * from alumno 
inner join alumno_se_matricula_asignatura on alumno.id = alumno_se_matricula_asignatura.id_alumno
inner join asignatura on alumno_se_matricula_asignatura.id_asignatura = asignatura.id
inner join curso_escolar on curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar
where curso_escolar.anyo_inicio = '2017' and curso_escolar.anyo_fin = '2018';

select * from alumno_se_matricula_asignatura;
select * from alumno;

--  1 Devuelve el número total de alumnas que hay.

select count(sexo) as total_alumnas from alumno where sexo = 'M';

--  2 Calcula cuántos alumnos nacieron en 1999.

select * from alumno where year(fecha_nacimiento) = '1999';
select count(fecha_nacimiento) as nacidos_en_1999 from alumno where year(fecha_nacimiento) = '1999';

-- 3 Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar
-- dos columnas, una con el nombre del departamento y otra con el número de profesores
-- que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen
-- profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores.


select d.nombre as departamento from departamento d inner join profesor p on departamento.id=nombre group by 1;

-- 4 Devuelve un listado con todos los departamentos y el número de profesores que hay 
-- en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen 
-- profesores asociados. Estos departamentos también tienen que aparecer en el listado.

select d.nombre as departamento from departamento d inner join profesor p on departamento.id=nombre group by 1;

-- 5 Devuelve un listado con el nombre de todos los grados existentes en la base de datos 
-- y el número de asignaturas que tiene cada uno. Tenga en cuenta que pueden existir
-- grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer 
-- en el listado. El resultado deberá estar ordenado de mayor a menor por el número 
-- de asignaturas.

select grado.nombre as grados, count(asignatura.id_grado) as total_asignatura from grado left join asignatura on grado.id = asignatura.id_grado group by 1 order by count(asignatura.id_grado) desc ;  


-- 6 Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.

select grado.nombre as grados, count(asignatura.id_grado) as total_asignatura from grado inner join asignatura on grado.id = asignatura.id_grado group by 1 having count(asignatura.id_grado) > 40;

-- 7 Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura.
-- El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo.
-- Ordene el resultado de mayor a menor por el número total de crédidos.

select grado.nombre as grados, asignatura.tipo, sum(asignatura.creditos) as total_creditos from grado left join asignatura on grado.id = asignatura.id_grado group by 1,2 order by sum(asignatura.creditos) desc;


-- 8 Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado deberá mostrar dos columnas, 
-- una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.

select curso_escolar.anyo_inicio as año_de_inico, count(alumno.id) as total_alumnos from alumno inner join alumno_se_matricula_asignatura am on am.id_alumno = alumno.id inner join curso_escolar on curso_escolar.id = am.id_alumno group by 1 ;

select * from alumno;
select * from departamento;
select * from profesor;


-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-- TALLER #2
-- 1 Devuelve todos los datos del alumno más joven.

select * from alumno where year(fecha_nacimiento) order by fecha_nacimiento asc limit 1; 

-- 2 Devuelve un listado con los profesores que no están asociados a un departamento.

select nombre,apellido1 from profesor where id_departamento is null;

-- 3 Devuelve un listado con los departamentos que no tienen profesores asociados.

select * from departamento inner join profesor on profesor.id_departamento where id_departamento is null;

-- 4 Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.

select distinct profesor.nombre as profesor , departamento.nombre as departamento , asignatura.id_profesor as asignatura from profesor inner join departamento on departamento.id = profesor.id_departamento inner join asignatura where asignatura.id_profesor is null;

-- 5 Devuelve un listado con las asignaturas que no tienen un profesor asignado.

select distinct asignatura.nombre from asignatura,profesor as nombre_asignatura_sin_profesor where id_profesor is null ;


-- 6 Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.

-- 7 Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).

-- 8 Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado.
-- El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor.
-- El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.Devuelve un listado con los profesores que no están asociados a un departamento.

-- 9 Devuelve un listado con los departamentos que no tienen profesores asociados.

-- 10 Devuelve un listado con los profesores que no imparten ninguna asignatura.

-- 11 Devuelve un listado con las asignaturas que no tienen un profesor asignado.

-- 12 Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar. El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.


