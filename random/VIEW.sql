CREATE VIEW tads3semestre AS 
SELECT aluno.nome, aluno.nro_matricula, aluno.telefone FROM aluno
INNER JOIN matricula ON
(aluno.id_aluno = matricula.id_aluno)
INNER JOIN turma ON
(matricula.id_turma = turma.id_turma)
INNER JOIN disciplina ON
(turma.id_disciplina = disciplina.id_disciplina)
INNER JOIN curso ON
(disciplina.id_curso = curso.id_curso)
WHERE turma.id_periodo_letivo = 3 AND disciplina.semestre = 3 AND curso.id_curso = 1
GROUP BY aluno.nome, aluno.nro_matricula, aluno.telefone;

CREATE VIEW tpg1semestre AS 
SELECT aluno.nome, aluno.nro_matricula, aluno.telefone FROM aluno
INNER JOIN matricula ON
(aluno.id_aluno = matricula.id_aluno)
INNER JOIN turma ON
(matricula.id_turma = turma.id_turma)
INNER JOIN disciplina ON
(turma.id_disciplina = disciplina.id_disciplina)
INNER JOIN curso ON
(disciplina.id_curso = curso.id_curso)
WHERE turma.id_periodo_letivo = 3 AND disciplina.semestre = 1 AND curso.id_curso = 2
GROUP BY aluno.nome, aluno.nro_matricula, aluno.telefone;

CREATE VIEW matrizTPG AS
SELECT disciplina.semestre, disciplina.nome, disciplina.ch FROM disciplina
INNER JOIN curso ON
(disciplina.id_curso = curso.id_curso)
WHERE curso.id_curso = 2
ORDER BY disciplina.semestre;

CREATE VIEW reprovacoesTADS AS
SELECT disciplina.nome AS disc_nome, disciplina.semestre, turma.id_periodo_letivo, docente.nome AS doc_nome, 
    COUNT(matricula.id_aluno) AS reprovados FROM disciplina
INNER JOIN curso ON
(curso.id_curso = disciplina.id_curso)
INNER JOIN turma ON
(turma.id_disciplina = disciplina.id_disciplina)
INNER JOIN docente ON
(docente.id_docente = turma.id_docente)
INNER JOIN matricula ON
(matricula.id_turma = turma.id_turma)
WHERE curso.id_curso = 1 AND (matricula.nota < 7.0 OR matricula.frequencia < 75.0)
GROUP BY disciplina.nome, disciplina.semestre, turma.id_periodo_letivo, docente.nome
ORDER BY reprovados DESC;

CREATE VIEW mediasTPG AS
SELECT disciplina.nome AS disc_nome, docente.nome AS doc_nome, TRUNC(AVG(matricula.nota), 2) AS avg_nota, 
    TRUNC(AVG(matricula.frequencia), 2) AS avg_freq FROM disciplina
INNER JOIN curso ON
(curso.id_curso = disciplina.id_curso)
INNER JOIN turma ON
(turma.id_disciplina = disciplina.id_disciplina)
INNER JOIN docente ON
(docente.id_docente = turma.id_docente)
INNER JOIN matricula ON
(matricula.id_turma = turma.id_turma)
WHERE disciplina.id_curso = 2 AND turma.id_periodo_letivo = 2
GROUP BY disciplina.nome, docente.nome
ORDER BY avg_nota;
