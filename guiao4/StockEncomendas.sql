CREATE TABLE Produto(
	IVA Int,
	nelem_stock Int,
	nome Varchar(20),
	preco Int,
	codigo Int PRIMARY KEY
);

CREATE TABLE TipoFornecedor(
	designacao Varchar(50),
	codigo Int PRIMARY KEY
);

CREATE TABLE Fornecedor(
	fax Varchar(50),
	endereco Varchar(50),
	nome Varchar(50),
	condPagamento Varchar(10),
	NIF Int PRIMARY KEY,
	FK_Codigo Int,
	FOREIGN KEY(FK_Codigo) REFERENCES TipoFornecedor(Codigo) 
);

CREATE TABLE Encomenda(
	data Int,
	fornecedor Varchar(50),
	numero Int PRIMARY KEY,
	FK_Codigo Int,
	FK_NIF Int,
	FOREIGN KEY(FK_Codigo) REFERENCES Produto(Codigo),
	FOREIGN KEY(FK_NIF) REFERENCES Fornecedor(NIF)
);

CREATE TABLE Item(
	nitem Int,
	numero1 Int,
	codigo1 Int,
	PRIMARY KEY(numero1, codigo1),
	FOREIGN KEY(numero1) REFERENCES ENCOMENDA(numero),
	FOREIGN KEY(codigo1) REFERENCES Produto(codigo)
);

CREATE TABLE TemTipo(
	NIF1 Int,
	codigo1 Int,
	PRIMARY KEY(NIF1, codigo1),
	FOREIGN KEY(NIF1) REFERENCES Fornecedor(NIF),
	FOREIGN KEY(codigo1) REFERENCES TipoFornecedor(codigo)
);