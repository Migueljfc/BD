CREATE TABLE Cliente(
	NIF Int PRIMARY KEY NOT NULL,
	Nome Varchar(50) NOT NULL,
	Endereco Varchar(50) NOT NULL,
	Num_carta Int NOT NULL
	Unique(Nome)
);

CREATE TABLE Balcao(
	Nome Varchar(50),
	Numero Int PRIMARY KEY,
	Endereco Varchar(50)
);

CREATE TABLE TipoVeiculo(
	Designacao Varchar(50) not null,
	Arcondicionado Bit,
	Codigo Int PRIMARY KEY not null
);

CREATE TABLE Ligeiro(
	Num_lugares Int,
	Num_portas Int,
	Combustivel Varchar(5),
	Codigo Int, 
	PRIMARY KEY(Codigo), 
	FOREIGN KEY(codigo) REFERENCES TipoVeiculo(Codigo)
);

CREATE TABLE Pesado(
	Peso Int,
	Num_passageiros Int,
	Codigo Int, 
	PRIMARY KEY(Codigo),
	FOREIGN KEY(Codigo) REFERENCES TipoVeiculo(Codigo)
);

CREATE TABLE Veiculo(
	Matricula char(10) PRIMARY KEY not null,
	Ano smallint check(Ano > 1990),
	Marca char(15) not null,
	FK_Tipo Int,
	FOREIGN KEY(FK_Tipo) REFERENCES TipoVeiculo(Codigo)
);

CREATE TABLE Aluguer(
	Numero Int PRIMARY KEY not null,
	Duracao Int,
	Data Int,
	FK_Cliente Int,
	FK_Balcao Int,
	FK_Veiculo char(10),
	FOREIGN KEY(FK_Cliente) REFERENCES Cliente(NIF),
	FOREIGN KEY(FK_Balcao) REFERENCES Balcao(Numero),
	FOREIGN KEY(FK_Veiculo) REFERENCES Veiculo(Matricula)
);

CREATE TABLE Similaridade(
	codigo1 Int,
	codigo2 Int,
	PRIMARY KEY(codigo1, codigo2),
	FOREIGN KEY(codigo1) REFERENCES TipoVeiculo(Codigo),
	FOREIGN KEY(codigo2) REFERENCES TipoVeiculo(Codigo)
);