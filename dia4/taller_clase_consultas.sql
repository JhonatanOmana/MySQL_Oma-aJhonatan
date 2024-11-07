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

select * from asignatura;
select * from grado ;

select * from grado
inner join asignatura on grado.nombre = asignatura.curso ;



