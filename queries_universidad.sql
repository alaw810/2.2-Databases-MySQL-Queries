USE universidad;

-- 1. Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre;

-- 2. Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;

-- 3. Retorna el llistat dels alumnes que van néixer en 1999.
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;

-- 4. Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K';

-- 5. Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
SELECT nombre FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

-- 6. Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS departamento FROM persona p JOIN profesor pr ON p.id = pr.id_profesor JOIN departamento d ON pr.id_profesor = d.id ORDER BY p.apellido1, p.apellido2, p.nombre;

-- 7. Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.
SELECT a.nombre AS asignatura, ce.anyo_inicio, ce.anyo_fin FROM persona p JOIN alumno_se_matricula_asignatura ama ON p.id = ama.id_alumno JOIN asignatura a ON ama.id_asignatura = p.id WHERE p.nif = '26902806M';

-- 8. Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
SELECT DISTINCT d.nombre AS departamento FROM departamento d JOIN profesor pr ON d.id = pr.id_departamento JOIN asignatura a ON pr.id_profesor = a.id_profesor JOIN grado g ON a.id_grado = g.id WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

-- 9. Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
SELECT DISTINCT p.apellido1, p.apellido2, p.nombre FROM persona p JOIN alumno_se_matricula_asignatura am ON p.id = am.id_alumno JOIN curso_escolar ce ON am.id_curso_escolar = ce.id WHERE ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019 AND p.tipo = 'alumno';

-- Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.

-- 1. Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
SELECT d.nombre AS nombre_departamento, p.apellido1, p.apellido2, p.nombre FROM profesor prof LEFT JOIN departamento d ON prof.id_departamento = d.id JOIN persona p ON prof.id_profesor = p.id ORDER BY d.nombre ASC, p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

-- 2. Retorna un llistat amb els professors/es que no estan associats a un departament.
SELECT p.id, p.nombre, p.apellido1, p.apellido2 FROM profesor prof LEFT JOIN departamento d ON prof.id_departamento = d.id JOIN persona p ON prof.id_profesor = p.id WHERE d.id IS NULL;

-- 3. Retorna un llistat amb els departaments que no tenen professors/es associats.
SELECT d.nombre AS nombre_departamento FROM departamento d LEFT JOIN profesor prof ON prof.id_departamento = d.id WHERE prof.id_departamento IS NULL;

-- 4. Retorna un llistat amb els professors/es que no imparteixen cap assignatura.
SELECT p.apellido1, p.apellido2, p.nombre FROM persona p JOIN profesor prof ON p.id = prof.id_profesor LEFT JOIN asignatura a ON prof.id_profesor = a.id_profesor WHERE a.id IS NULL;

-- 5. Retorna un llistat amb les assignatures que no tenen un professor/a assignat.
SELECT a.nombre FROM asignatura a LEFT JOIN profesor prof ON a.id_profesor = prof.id_profesor WHERE prof.id_profesor IS NULL;

-- 6. Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
SELECT d.nombre AS nombre_departamento FROM departamento d LEFT JOIN profesor prof ON prof.id_profesor = d.id LEFT JOIN asignatura a ON d.id = a.id_profesor LEFT JOIN alumno_se_matricula_asignatura am ON am.id_asignatura = a.id WHERE am.id_alumno IS NULL GROUP BY d.id;

-- Consultes resum:

-- 1. Retorna el nombre total d'alumnes que hi ha.
SELECT COUNT(id) AS total_alumnos FROM persona WHERE tipo = 'alumno';

-- 2. Calcula quants alumnes van néixer en 1999.
SELECT COUNT(id) AS total_alumnos_1999 FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;

-- 3. Calcula quants professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.
SELECT d.nombre, COUNT(prof.id_profesor) AS numero_profesores FROM departamento d JOIN profesor prof ON prof.id_departamento = d.id GROUP BY d.nombre ORDER BY numero_profesores DESC;

-- 4. Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors/es associats. Aquests departaments també han d'aparèixer en el llistat.
SELECT d.nombre, COUNT(prof.id_profesor) AS numero_profesores FROM departamento d LEFT JOIN profesor prof ON prof.id_departamento = d.id GROUP BY d.nombre;

-- 5. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingues en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
SELECT g.nombre, COUNT(a.id) AS numero_asignaturas FROM grado g LEFT JOIN asignatura a ON a.id_grado = g.id GROUP BY g.nombre ORDER BY numero_asignaturas DESC;

-- 6. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
SELECT g.nombre, COUNT(a.id) AS numero_asignaturas FROM grado g LEFT JOIN asignatura a ON a.id_grado = g.id GROUP BY g.nombre HAVING COUNT(a.id) > 40 ORDER BY numero_asignaturas DESC;

-- 7. Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.
SELECT g.nombre, a.tipo, SUM(a.creditos) AS numero_creditos FROM grado g JOIN asignatura a ON a.id_grado = g.id GROUP BY g.nombre, a.tipo;

-- 8. Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.
SELECT ce.anyo_inicio, COUNT(DISTINCT am.id_alumno) AS numero_alumnos FROM curso_escolar ce JOIN alumno_se_matricula_asignatura am ON ce.id = am.id_curso_escolar GROUP BY ce.anyo_inicio;

-- 9. Retorna un llistat amb el nombre d'assignatures que imparteix cada professor/a. El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.
SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS numero_asignaturas FROM profesor prof LEFT JOIN asignatura a ON a.id_profesor = prof.id_profesor JOIN persona p ON p.id = prof.id_profesor GROUP BY p.id ORDER BY numero_asignaturas DESC;

-- 10. Retorna totes les dades de l'alumne/a més jove.
SELECT * FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento = (SELECT MIN(fecha_nacimiento) FROM persona WHERE tipo = 'alumno');

-- 11. Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura.
SELECT p.id, p.nombre, p.apellido1, p.apellido2, d.nombre AS nombre_departamento, COUNT(a.id) AS numero_asignaturas FROM profesor prof JOIN persona p ON prof.id_profesor = p.id LEFT JOIN asignatura a ON prof.id_profesor = a.id_profesor JOIN departamento d ON d.id = prof.id_departamento GROUP BY p.id HAVING COUNT(a.id) = 0;
