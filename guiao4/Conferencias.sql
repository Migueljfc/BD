CREATE TABLE MembroInstituicao(
	email Varchar(30) not null,
	nome Varchar(30) not null,
	PRIMARY KEY(email)
);

CREATE TABLE ArtigoCientifico(
	numero Int not null,
	PRIMARY KEY(numero),
	titulo Varchar(30)
);

CREATE TABLE Autor(
	email Varchar(30) not null,
	FK_artigo Int,
	PRIMARY KEY(email),
	FOREIGN KEY(FK_artigo) REFERENCES ArtigoCientifico(numero),
	FOREIGN KEY(email) REFERENCES MembroInstituicao(email)
);

CREATE TABLE Escreve(
	email1 Varchar(30) not null,
	numero1 Int,
	PRIMARY KEY(email1, numero1),
	FOREIGN KEY(email1) REFERENCES Autor(email),
	FOREIGN KEY(numero1) REFERENCES ArtigoCientifico(numero)
);

CREATE TABLE Participantes(
	email Varchar(30) PRIMARY KEY not null,
	dataInscricao Int,
	morada Varchar(60),
	FOREIGN KEY(email) REFERENCES MembroInstituicao(email)
);

CREATE TABLE Estudante(
	email Varchar(30) PRIMARY KEY not null,
	FOREIGN KEY(email) REFERENCES Participantes(email),
);

CREATE TABLE NaoEstudante(
	email Varchar(30) not null,
	referencia Varchar(50),
	PRIMARY KEY(email),
	FOREIGN KEY(email) REFERENCES Participantes(email)
);

CREATE TABLE Comprovativo(
	localizacao Varchar(20) not null,
	FK_email Varchar(30),
	PRIMARY KEY(localizacao),
	FOREIGN KEY(FK_email) REFERENCES Estudante(email)
);

CREATE TABLE InstituicaoEnsino(
	nome Varchar(30) not null,
	FK_Comprovativo Varchar(20),
	PRIMARY KEY(nome),
	FOREIGN KEY(FK_comprovativo) REFERENCES Comprovativo(localizacao) 
);

CREATE TABLE Instituicao(
	nome Varchar(30) PRIMARY KEY not null,
	endereco Varchar(50),
	FK_membro Varchar(30),
	FK_ensino Varchar(30),
	FOREIGN KEY(FK_membro) REFERENCES MembroInstituicao(email),
	FOREIGN KEY(FK_ensino) REFERENCES InstituicaoEnsino(nome)
);