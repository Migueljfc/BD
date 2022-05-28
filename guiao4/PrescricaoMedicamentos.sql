CREATE TABLE Farmacia(
	nome Varchar(30) not null,
	endereco Varchar(50),
	telefone Int,
	nif Int PRIMARY KEY
);

CREATE TABLE Medico(
	nome Varchar(30) not null,
	especialidade Varchar(15) not null,
	numero Int PRIMARY KEY
);

CREATE TABLE Paciente(
	nome Varchar(30) not null,
	endereco Varchar(50),
	data Int,
	numero Int PRIMARY KEY
);

CREATE TABLE Farmaceutica(
	nome Varchar(30) not null,
	endereco Varchar(50),
	telefone Int,
	numero Int PRIMARY KEY
);

CREATE TABLE Farmaco(
	nome Varchar(30) not null,
	formula Varchar(20) PRIMARY KEY,
	FK_numero Int FOREIGN KEY REFERENCES Farmaceutica(numero) 
);

CREATE TABLE Prescricao(
	data Int,
	numero Int PRIMARY KEY,
	FK_nif Int FOREIGN KEY(FK_nif) REFERENCES Farmacia(nif),
	FK_numero Int FOREIGN KEY REFERENCES Medico(numero),
	FK_formula Varchar(20) FOREIGN KEY REFERENCES Farmaco(formula),
	FK_paciente Int FOREIGN KEY REFERENCES Paciente(numero)
);