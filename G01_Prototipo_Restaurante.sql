CREATE DATABASE Restaurante_Prototipo
DEFAULT CHARACTER SET utf8;
/* Usando la base de datos */

USE Restaurante_Prototipo;
/* Creando las tablas */
CREATE table Ubigeo(
	Cod_Ubigeo INT AUTO_INCREMENT,
	Departamento VARCHAR(50) NOT NULL,
	Provincia VARCHAR(50) NOT NULL,
    Distrito VARCHAR(50) NOT NULL,
	PRIMARY KEY (Cod_Ubigeo)
);

INSERT INTO Ubigeo (Cod_Ubigeo , Departamento , Provincia, Distrito)
VALUES ('1', 'Lima' , 'Cañete' , 'SanVicente'),
	   ('2', 'Apurimac' , 'Abancay' , 'Curasco'),
	   ('3', 'Arequipa' , 'Provincia de Arequipa' , 'Characato'),
       ('4', 'Cajamarca' , 'Yakanora' , 'Asuncion'),
       ('5', 'Lambayeque' , 'Chiclayo' , 'Jayanca'),
       ('6', 'Tumbes' , 'Tumbes' , 'La cruz'),
       ('7', 'Tacna' , 'Tacna' , 'Calana'),
       ('8', 'Puno' , 'Puno' , 'Acora'),
       ('9', 'Piura' , 'Piura' , 'Castilla'),
       ('10', 'Pasco' , 'Huachon' , 'Pasco');
       


CREATE table Cliente(
	Id_Cliente INT AUTO_INCREMENT,
    Cod_Ubigeo INT,
	Nombre VARCHAR(30),
	Ap_Paterno VARCHAR(30),
    Ap_Materno VARCHAR(30),
    Telefono char(9),
	PRIMARY KEY (Id_Cliente),
	foreign key (Cod_Ubigeo) references Ubigeo(Cod_Ubigeo)
);

INSERT INTO Cliente (Id_Cliente  ,  Cod_Ubigeo , Nombre , Ap_Paterno,Ap_Materno,Telefono)
VALUES ('1', '1' , 'Abel' , 'Mamani','Huascar','989008703'),
 ('2', '2' , 'Jhanpool' , 'Pancrasio','Condori','923434656'),
 ('3', '3' , 'Rey' , 'Quispe','Lara','934452234'),
 ('4', '4' , 'Yakanora' , 'Asuncion','Vilchez','978457347'),
 ('5', '5' , 'Cecilia' , 'Caceres','Flores','923536234'),
 ('6', '6' , 'Esteban' , 'Rigoberto','Perez','975637671'),
 ('7', '7' , 'Naomi' , 'Bautista','Paucar','964267483'),
 ('8', '8' , 'Jeremias' , 'Pantano','Vergara','953625367'),
 ('9', '9' , 'Anacleta' , 'Hurtado','Levano','964836583'),
 ('10', '10' , 'Pedro' , 'Castle','Huamanripa','964836432');


CREATE table Empleado(
	Id_Empleado INT AUTO_INCREMENT,
    Id_Cliente 	INT,
	Cod_Ubigeo INT,
    Nombre VARCHAR(30),
	Ap_Paterno VARCHAR(30),
    Ap_Materno VARCHAR(30),
    Telefono char(9),
    Horario VARCHAR(10),
	PRIMARY KEY (Id_Empleado),
    foreign key (Cod_Ubigeo) references Ubigeo(Cod_Ubigeo),
    foreign key (Id_Cliente) references Cliente(Id_Cliente)
);

INSERT INTO Empleado (Id_Empleado  , Id_Cliente , Cod_Ubigeo  , Nombre ,Ap_Paterno, Ap_Materno,Telefono,Horario)
VALUES ('1', '1' , '1' , 'Alma','Astocondor','Atoche','974687432','tarde'),
('2', '2' , '2' , 'Jett','Robles','Zambrano','975738742','tarde'),
('3', '3' , '3' , 'Benito','Yupanqui','Casas','954783867','noche'),
('4', '4' , '4' , 'Consuelo','Jimenes','Ladrillo','973654236','mañana'),
('5', '5' , '5' , 'Angel','Ibarra','Yataco','968264873','madrugada'),
('6', '6' , '6' , 'Andrea','Contreras','Fernandez','964827473','noche'),
('7', '7' , '7' , 'Brenda','Camayo','Carhuancho','976489267','tarde'),
 ('8', '8' , '8' , 'Arnold','Moreno','Beltran','954827464','madrugada'),
 ('9', '9' , '9' , 'Brigeet','Rosas','Melano','962876826','noche'),
 ('10', '10' , '10' , 'Dario','Acuña','Vilca','964827437','noche');

CREATE table Pedido(
	Id_Pedido INT AUTO_INCREMENT,
    Id_Cliente 	INT,
	Id_Empleado INT,
    Precio float,
	Nombre VARCHAR(30),
    Cantidad int,
	PRIMARY KEY (Id_Pedido),
    foreign key (Id_Cliente) references Cliente(Id_Cliente),
    foreign key (Id_Empleado) references Empleado(Id_Empleado)
);

INSERT INTO Pedido (Id_Pedido , Id_Cliente , Id_Empleado, Precio,Nombre,Cantidad)
VALUES ('1', '1' , '1' , '15.00','PedidoLocal','1'),
('2', '2' , '2' , '50.00','PedidoDelivery','2'),
('3', '3' , '3' , '120.00','PedidoLocal','3'),
 ('4', '4' , '4' , '30.00','PedidoLocal','1'),
 ('5', '5' , '5' , '45.00','PedidoDelivery','4'),
 ('6', '6' , '6' , '60.00','PedidoLocal','2'),
 ('7', '7' , '7' , '23.00','PedidoDelivery','1'),
 ('8', '8' , '8' , '12.00','PedidoLocal','5'),
 ('9', '9' , '9' , '80.00','PedidoLocal','1'),
 ('10', '10' , '10' , '65.00','PedidoDelivery','2');

CREATE table Venta(
	Codigo_Venta INT AUTO_INCREMENT,
    Id_Pedido INT,
    Fecha DATE,
    Total float,
	PRIMARY KEY (Codigo_Venta),
    foreign key (Id_Pedido) references Pedido(Id_Pedido)
);

INSERT INTO Venta (Codigo_Venta , Id_Pedido , Fecha, Total)
VALUES ('1', '1' , '02/07/21' , '15'),
('2', '2' , '03/07/21' , '100.00'),
('3', '3' , '07/07/21' , '360.00'),
('4', '4' , '10/07/21' , '30.00'),
('5', '5' , '14/07/21' , '180.00'),
('6', '6' , '16/07/21' , '120.00'),
('7', '7' , '20/07/21' , '23.00'),
('8', '8' , '04/07/21' , '60.00'),
('9', '9' , '05/07/21' , '80.00'),
('10', '10' , '09/07/21' , '190.00');

CREATE table Restaurante(
	Id_RUC INT AUTO_INCREMENT,
	Nombre VARCHAR (50),
    Descripcion VARCHAR (90),
    Telefono char(9),
    Correo VARCHAR(30),
	PRIMARY KEY (Id_RUC)
);
INSERT INTO Restaurante (Id_RUC ,Nombre,Descripcion,Telefono,Correo)
VALUES ('1', 'Campitos' , 'La comida que te gusta Aqui' , '978583756','campito@gmail.com'),
('2', 'El Buen Gusto' , 'Ven con nosotros' , '974837487','Gusto@gmail.com'),
('3', 'La Sazon' , 'No hay como nostros' , '939939321','sazon@gmail.com'),
('4', 'El piloto' , 'Comida natural' , '963878723','piloto@gmail.com'),
('5', 'Los Delfines' , 'El mara a tu boca' , '948384674','delfin@gmail.com'),
('6', 'Sabor Peruano' , 'Comida de reices' , '958394643','peru@gmail.com'),
('7', 'La Bolichera' , 'La frescura para ti' , '964835445','bolichera@gmail.com'),
('8', 'Deigo' , 'Infuciones' , '975837483','deigo@gmail.com'),
('9', 'El Rancho' , 'Lo natural a tu gusto' , '964827473','rancho@gmail.com'),
('10', 'Anchobeta Azul' , 'todo lo bueno para ti' , '975828748','azul@gmail.com');

CREATE table Menu(
	Codigo_Menu INT AUTO_INCREMENT,
    Id_RUC INT,
	Nombre VARCHAR (50),
	PRIMARY KEY (Codigo_Menu),
    foreign key (Id_Ruc) references Restaurante(Id_Ruc)
);

INSERT INTO Menu (Codigo_Menu , Id_RUC , Nombre)
VALUES ('1', '1' , 'Menu Marino' ),
 ('2', '2' , 'Menu mixto' ),
 ('3', '3' , 'Menu Criollo' ),
 ('4', '4' , 'Menu marino ' ),
 ('5', '5' , 'Menu criollo' ),
 ('6', '6' , 'Menu Mixto' ),
 ('7', '7' , 'Menu Criollo' ),
 ('8', '8' , 'Menu Mixto' ),
 ('9', '9' , 'Menu criollo' ),
 ('10', '10' , 'Menu Marino' );

CREATE table Producto(
	Codigo_Producto INT AUTO_INCREMENT,
    Codigo_Menu INT,
    Descripcion text,
    Nombre VARCHAR (50),
    Precio float,
	PRIMARY KEY (Codigo_Producto),
    foreign key (Codigo_Menu) references Menu(Codigo_Menu)
);

INSERT INTO Producto (Codigo_Producto , Codigo_Menu , Descripcion, Nombre, Precio)
VALUES ('1', '1' , 'Bueno' ,'Adobo de Pollo','15.00'),
('2', '2' , 'Posee muy buenas Caracteristicas' ,'Trucha Frita', '50.00'),
('3', '3' , 'Es muy completo' ,'Sopa Seca', '120.00'),
('4', '4' , 'Las caracteristicas son las correctas','Cau Cau', '15.00'),
('5', '5' , 'Buena Presentacion','Caldo de Gallina', '45.00'),
('6', '6' , 'Buena Presentacion','Arroz Chaufa', '60.00'),
('7', '7' , 'Productos en buen estado','Ternero al vino', '23.00'),
('8', '8' , 'Las caracteristicas son las correctas','Chilcano', '60.00'),
('9', '9' , 'Productos en buen estado' ,'Arroz con Mariscos', '80.00'),
('10', '10' , 'Es muy completo' ,'Ceviche', '65.00');

CREATE table Venta_Detalle(
	Codigo_VentaDetalle INT AUTO_INCREMENT,
    Codigo_Venta INT,
    Codigo_Producto int,
    Cantidad int,
    Precio int,
	PRIMARY KEY (Codigo_VentaDetalle),
    foreign key (Codigo_Venta) references Venta(Codigo_Venta),
    foreign key (Codigo_Producto) references Producto(Codigo_Producto)
);

INSERT INTO Venta_Detalle (Codigo_VentaDetalle , Codigo_Venta , Codigo_Producto, Cantidad,Precio)
VALUES ('1', '1' , '1' , '1','30.00'),
('2', '2' , '2' , '2','100.00'),
('3', '3' , '3' , '2','240.00'),
('4', '4' , '4' , '3','45.00'),
('5', '5' , '5' , '1','45.00'),
('6', '6' , '6' , '1','60.00'),
('7', '7' , '7' , '2','46.00'),
('8', '8' , '8' , '4','240.00'),
('9', '9' , '9' , '2','160.00'),
('10', '10' , '10' , '1','65.00');

CREATE table Menu_Producto(
	Codigo_MenuProducto INT AUTO_INCREMENT,
    Codigo_Menu INT,
	Codigo_Producto INT,
    Categoria varchar(20),
	PRIMARY KEY (Codigo_MenuProducto),
    foreign key (Codigo_Menu) references Menu(Codigo_Menu),
    foreign key (Codigo_Producto) references Producto(Codigo_Producto)
);

INSERT INTO Menu_Producto (Codigo_MenuProducto ,  Codigo_Menu , Codigo_Producto , Categoria)
VALUES ('1', '1' , '1' , 'Criollo'),
('2', '2' , '2' , 'Criollo'),
('3', '3' , '3' , 'Criollo'),
('4', '4' , '4' , 'Marino'),
('5', '5' , '5' , 'Criollo'),
('6', '6' , '6' , 'Marino'),
('7', '7' , '7' , 'Criollo'),
('8', '8' , '8' , 'Criollo'),
('9', '9' , '9' , 'Marino'),
('10', '10' , '10' , 'Criollo');

SELECT * FROM Ubigeo;
SELECT * FROM Cliente;
SELECT * FROM Empleado;
SELECT * FROM Pedido;
SELECT * FROM Venta;
SELECT * FROM Restaurante;
SELECT * FROM Menu;
SELECT * FROM Producto;
SELECT * FROM Venta_Detalle;
SELECT * FROM Menu_Producto;