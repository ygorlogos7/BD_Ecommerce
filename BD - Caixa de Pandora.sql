CREATE TABLE [Categoria] (
	[id_da_categoria] nvarchar(70) NOT NULL,
	[nome_da_categoria] nvarchar(max) NOT NULL,
	[descricao] nvarchar(200) NOT NULL,
	PRIMARY KEY ([id_da_categoria])
);

CREATE TABLE [Produto] (
	[Id_do_produto] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Nome_do_produto] nvarchar(200) NOT NULL,
	[Descricao] nvarchar(200),
	[Preco] decimal(10) NOT NULL,
	[Quantidade_em_estoque] int NOT NULL,
	[Id_da_categoria] int NOT NULL,
	[Categoria] nvarchar(100),
	[Id_da_marca ] int NOT NULL,
	[Marca] nvarchar(100),
	PRIMARY KEY ([Id_do_produto])
);

CREATE TABLE [Marca] (
	[id_da_marca] nvarchar(20) NOT NULL UNIQUE,
	[Nome_da_marca] nvarchar(100) NOT NULL,
	[Descricao] nvarchar(200) NOT NULL,
	PRIMARY KEY ([id_da_marca])
);

CREATE TABLE [Endereco] (
	[id_do_cliente] nvarchar(20) UNIQUE,
	[CEP] int NOT NULL,
	[rua] nvarchar(100) NOT NULL,
	[numero] int,
	[bairro] nvarchar(100) NOT NULL,
	[cidade] nvarchar(100) NOT NULL,
	[estado] nvarchar(100) NOT NULL
);

CREATE TABLE [Cliente] (
	[Id_do_Cliente ] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Nome_Completo] nvarchar(80) NOT NULL,
	[Senha] nvarchar(10) NOT NULL,
	[E-mail] nvarchar(80) NOT NULL,
	[Endereço_de_entrega] nvarchar(100) NOT NULL,
	[Historico_de_Pedidos] nvarchar(100) NOT NULL,
	[Telefone] int NOT NULL,
	PRIMARY KEY ([Id_do_Cliente ])
);

	CREATE TABLE [Pedido] (
	[id_do_pedido] nvarchar(100) NOT NULL,
	[id_do_cliente] nvarchar(100),
	[Id_produto] int,
	[data_do_pedido] date NOT NULL,
	[status_do_pedido] nvarchar(10) NOT NULL,
	[itens_do_pedido] int NOT NULL,
	[metodo_do_pagamento] nvarchar(10) NOT NULL,
	[total_do_pedido] decimal(10) NOT NULL,
	PRIMARY KEY ([id_do_pedido])
);

CREATE TABLE [Item_Pedido] (
	[id_do_item_do_pedido] nvarchar(20) NOT NULL UNIQUE,
	[id_do_pedido] nvarchar(20),
	[id_do_produto] nvarchar(20),
	[quantidade] int NOT NULL,
	[preco_unitario] decimal(10) NOT NULL,
	PRIMARY KEY ([id_do_item_do_pedido])
);

CREATE TABLE [Carrinho] (
	[id_do_carrinho] nvarchar(20) NOT NULL UNIQUE,
	[id_do_cliente] nvarchar(100) NOT NULL,
	[itens_do_carrinhos] int NOT NULL,
	PRIMARY KEY ([id_do_carrinho])
);

CREATE TABLE [Itens_do_carrinho] (
	[id_do_produto] int NOT NULL,
	[Quantidade] int NOT NULL,
	[id_do_carrinho] int
);


ALTER TABLE [Produto] ADD CONSTRAINT [Produto_fk5] FOREIGN KEY ([Id_da_categoria]) REFERENCES [Categoria]([id_da_categoria]);

ALTER TABLE [Produto] ADD CONSTRAINT [Produto_fk7] FOREIGN KEY ([Id_da_marca ]) REFERENCES [Marca]([id_da_marca]);

ALTER TABLE [Endereço] ADD CONSTRAINT [Endereço_fk0] FOREIGN KEY ([id_do_cliente]) REFERENCES [Cliente]([Id_do_Cliente ]);

ALTER TABLE [Pedido] ADD CONSTRAINT [Pedido_fk1] FOREIGN KEY ([id_do_cliente]) REFERENCES [Cliente]([Id_do_Cliente ]);

ALTER TABLE [Pedido] ADD CONSTRAINT [Pedido_fk2] FOREIGN KEY ([Id_produto]) REFERENCES [Produto]([Id_do_produto]);
ALTER TABLE [Item_Pedido] ADD CONSTRAINT [Item_Pedido_fk1] FOREIGN KEY ([id_do_pedido]) REFERENCES [Pedido]([id_do_pedido]);

ALTER TABLE [Item_Pedido] ADD CONSTRAINT [Item_Pedido_fk2] FOREIGN KEY ([id_do_produto]) REFERENCES [Produto]([Id_do_produto]);
ALTER TABLE [Carrinho] ADD CONSTRAINT [Carrinho_fk1] FOREIGN KEY ([id_do_cliente]) REFERENCES [Cliente]([Id_do_Cliente ]);
ALTER TABLE [Itens_do_carrinho] ADD CONSTRAINT [Itens_do_carrinho_fk0] FOREIGN KEY ([id_do_produto]) REFERENCES [Produto]([Id_do_produto]);

ALTER TABLE [Itens_do_carrinho] ADD CONSTRAINT [Itens_do_carrinho_fk2] FOREIGN KEY ([id_do_carrinho]) REFERENCES [Carrinho]([id_do_carrinho]);