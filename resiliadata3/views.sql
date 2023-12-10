-- Verifica os alunos matriculados no curso de numero 20
select cpf from aluno
join matricula on aluno.cpf like matricula.cpf_aluno_fk
join curso on matricula.id_curso_fk like curso.id_curso
join turma on curso.id_curso like turma.curso_fk
where curso_fk = 20
;