create database formativa_1e_2;

create table Universidade (
    id_uni int primary key auto_increment,
    nome varchar(255) not null,
    telefone varchar(20),
    endereco varchar(255)
);
 
create table Estudante (
    id_estudante int primary key auto_increment,
    nome varchar(255) not null,
    telefone varchar(20),
    rua varchar(255),
    cep varchar(10),
    bairro varchar(255),
    id_uni int,
    foreign key (id_uni) references Universidade(id_uni)
);
-- ---------------------------------------------------------
insert into Universidade (nome, telefone, endereco) values 
	("Universidade Estadual Paulista", "15-1234-5678", "Rua das Universidades, 100 - Itapetininga"),
	("Universidade Federal de São Paulo", "15-2345-6789", "Avenida dos Estudantes, 200 - Itapetininga"),
	("Universidade de Itapetininga", "15-3456-7890", "Rua Central, 50 - Itapetininga"),
	("Centro Universitário de Itapetininga", "15-4567-8901", "Praça Universitária, 10 - Itapetininga"),
	("Instituto Tecnológico de Itapetininga", "15-5678-9012", "Avenida do Saber, 300 - Itapetininga");
 
insert into Estudante (nome, telefone, rua, cep, bairro, id_uni) values
	("Pérola", "15-1111-2222", "Rua A", "18200-000", "Centro", 1),
	("Ameliê", "15-2222-3333", "Rua B", "18200-001", "Centro", 2),
	("Nina", "15-3333-4444", "Rua C", "18200-002", "Centro", 3),
	("Mel", "15-4444-5555", "Rua D", "18200-003", "Centro", 4),
	("Meg", "15-5555-6666", "Rua E", "18200-004", "Centro", 5);
-- -------------------------------------------------------

select * from Universidade;
select * from Estudante;
 

update Estudante
set nome = "NovoNome"
where id_estudante = 1;
 
update Universidade
set nome = "NovoNomeUniversidade"
where id_uni = 3;
 
delete from Estudante
where id_estudante = 5;
 

select Universidade.id_uni, Universidade.nome as nome_universidade, Universidade.telefone as telefone_universidade, 
       Universidade.endereco, Estudante.id_estudante, Estudante.nome as nome_estudante, 
       Estudante.telefone as telefone_estudante, Estudante.rua, Estudante.cep, Estudante.bairro
from Universidade
left join Estudante on Universidade.id_uni = Estudante.id_uni;
 

create or replace view vw_UniversidadeEstudante as
select Universidade.id_uni, Universidade.nome as nome_universidade, Universidade.telefone as telefone_universidade, 
       Universidade.endereco, Estudante.id_estudante, Estudante.nome as nome_estudante, 
       Estudante.telefone as telefone_estudante, Estudante.rua, Estudante.cep, Estudante.bairro
from Universidade
left join Estudante on Universidade.id_uni = Estudante.id_uni;

select * from vw_UniversidadeEstudante;