SET NAMES 'UTF8MB4';
DROP DATABASE IF EXISTS tienda;
CREATE DATABASE IF NOT EXISTS tienda DEFAULT CHARACTER SET UTF8MB4;
USE tienda;

# -----------------------------------
# Base de Datos Pagina Web


CREATE TABLE roles(
    id_rol      INT NOT NULL AUTO_INCREMENT,
    tipo        VARCHAR(30),
    PRIMARY KEY(id_rol)
);

CREATE TABLE usuarios(
    id_usuario      INT NOT NULL AUTO_INCREMENT,
    nombre          varchar(50) NOT NULL,
    ap_materno      varchar(50) NOT NULL,
    ap_paterno      varchar(50) NOT NULL,
    correo          varchar(50) NOT NULL,
    telefono        varchar(50) NOT NULL,
    username        varchar(50) NOT NULL,
    pass			varchar(200) NOT NULL,
    id_rol			INT NOT NULL,	

    PRIMARY KEY(id_usuario),
    FOREIGN KEY(id_rol) REFERENCES roles(id_rol)
);

CREATE TABLE pago(
    id_pago                 INT NOT NULL AUTO_INCREMENT,
    nombre_en_tarjeta       varchar(30),
    numero_en_tarjeta       INT(16),
    vencimiento             DATETIME,
    id_usuario				INT NOT NULL,

    PRIMARY KEY(id_pago),
    FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuario)
);


CREATE TABLE pedidos (
    id_pedidos   INT NOT NULL AUTO_INCREMENT,
    fecha       DATE,
    total       INT,
    id_usuario	INT,
    id_pago		INT,	

<<<<<<< HEAD
    PRIMARY KEY(id_pedidos),
    FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario),
=======
    PRIMARY KEY(id_pedido),
    FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuario),
>>>>>>> 4a2402ebab24398edce9069436771a6d4c4e27dd
    FOREIGN KEY(id_pago) REFERENCES pago(id_pago)
);



CREATE TABLE plataformas(
    id_plataformas   INT NOT NULL AUTO_INCREMENT,
    nombre          varchar(20),
    PRIMARY KEY(id_plataformas)
);


CREATE TABLE videojuegos(
    id_videojuegos   INT NOT NULL AUTO_INCREMENT,
    titulo          varchar(50) NOT NULL,
    imagen          varchar(255) NOT NULL,
    trailer         varchar(255)  NOT NULL,
	
    PRIMARY KEY(id_videojuegos)
);

<<<<<<< HEAD
CREATE TABLE videojuegos_plataformas(
    id_plataformas	INT,
    id_videojuegos	INT,
=======
CREATE TABLE videojuego_plataformas(
    id_plataforma	INT,
    id_videojuego	INT,
>>>>>>> 4a2402ebab24398edce9069436771a6d4c4e27dd
    stock       	INT,
    costo       	INT,
    precio      	INT,
    
<<<<<<< HEAD
    FOREIGN KEY(id_plataformas) REFERENCES plataformas(id_plataformas),
    FOREIGN KEY(id_videojuegos) REFERENCES videojuegos(id_videojuegos)
=======
    PRIMARY KEY (id_plataforma, id_videojuego),
    FOREIGN KEY(id_plataforma) REFERENCES plataforma(id_plataforma),
    FOREIGN KEY(id_videojuego) REFERENCES videojuego(id_videojuego)
>>>>>>> 4a2402ebab24398edce9069436771a6d4c4e27dd
);

CREATE TABLE pedidos_videojuegos(
	  id_pedidos		INT,
    id_videojuegos	INT,
    cantidad        INT(10),
    FOREIGN KEY(id_pedidos) REFERENCES pedidos(id_pedidos),
    FOREIGN KEY(id_videojuegos) REFERENCES videojuegos(id_videojuegos)
);


# Insertando Datos

# Roles
INSERT INTO roles(tipo) VALUES
("Administrador"),
("Usuario");

# Plataforma 
INSERT INTO plataformas(nombre) VALUES
("Xbox"),
("PlayStation"),
("Nintendo");



#VIDEOJUEGO

-- Insertar datos en la tabla videojuego
INSERT INTO videojuegos (titulo, imagen, trailer)
VALUES 
('Cyberpunk 2077', 'image/games/ciber.jpg', 'https://www.youtube.com/embed/8X2kIfS6fb8?si=szMiLdO-r_ZXkmFT'),
('Gears of War 3', 'image/games/gears.jpg', 'https://www.youtube.com/embed/n7Te5fcnrUA?si=RgRcW9zQEs_69eng'),
('Halo 2', 'image/games/halo.jpg', 'https://www.youtube.com/embed/kjN1eWhzPeA?si=GF-lIpUlCFAFe-0h'),
('Injustice 2', 'image/games/injustice.jpg', 'https://www.youtube.com/embed/G50rQ6SRCvQ?si=LfDwL9VLP-s4_6Kf'),
('Red Dead Redemption 2', 'image/games/red.jpg', 'https://www.youtube.com/embed/gmA6MrX81z4?si=l7R05a4r566w--N8'),
('Elden Ring', 'image/games/elden.jpg', 'https://www.youtube.com/embed/K_03kFqWfqs?si=F8QpjYVOtNiHZt3K'),
('God of War Ragnarok', 'image/games/gow.jpg', 'https://www.youtube.com/embed/F3jePdO9_jc?si=g8TxxtOtzVt8omL0'),
('GTA V', 'image/games/gta.jpg', 'https://www.youtube.com/embed/hvoD7ehZPcM?si=p-SbAnRvnmYoIv7f'),
('Resident Evil 4', 'image/games/resident.jpg', 'https://www.youtube.com/embed/E69tKrfEQag?si=5e8NerwJ_X1244dM'),
('The Last of Us 2', 'image/games/tlou.jpg', 'https://www.youtube.com/embed/-llaUBqovHw?si=9M-wQPtxXmMQx9mV'),
('Cuphead', 'image/games/cup.png', 'https://www.youtube.com/embed/NN-9SQXoi50?si=86YzOUjjwhTLKDNg'),
('Mario Bros', 'image/games/supermario.png', 'https://www.youtube.com/embed/6wTFy-pJFMI?si=7H72S0Y44b-PEHh1'),
('Splatoon 3', 'image/games/splatoon.png', 'https://www.youtube.com/embed/GUYDXVDLmns?si=QdQBt2xcSGKvVWyf'),
('Super Smash Bros', 'image/games/smash.png', 'https://www.youtube.com/embed/WShCN-AYHqA?si=GOaDonn5yYP7OOXe'),
('The Legend of Zelda', 'image/games/zelda.jpg', 'https://www.youtube.com/embed/sjxLF4IYnJc?si=nWDSxREiLeNb8Lve');

#videojuego_plataforma

-- Insertar datos en la tabla de relación videojuego_plataforma para Xbox
<<<<<<< HEAD
INSERT INTO videojuegos_plataformas (id_videojuegos, id_plataformas, costo, precio, stock)
=======
INSERT INTO videojuego_plataformas (id_videojuego, id_plataforma, costo, precio, stock)
>>>>>>> 4a2402ebab24398edce9069436771a6d4c4e27dd
VALUES 
((SELECT id_videojuegos FROM videojuegos WHERE titulo = 'Cyberpunk 2077'), (SELECT id_plataformas FROM plataformas WHERE nombre = 'Xbox'), 450.00, 499.00, 100),
((SELECT id_videojuegos FROM videojuegos WHERE titulo = 'Gears of War 3'), (SELECT id_plataformas FROM plataformas WHERE nombre = 'Xbox'), 350.00, 399.00, 100),
((SELECT id_videojuegos FROM videojuegos WHERE titulo = 'Halo 2'), (SELECT id_plataformas FROM plataformas WHERE nombre = 'Xbox'), 250.00, 299.00, 100),
((SELECT id_videojuegos FROM videojuegos WHERE titulo = 'Injustice 2'), (SELECT id_plataformas FROM plataformas WHERE nombre = 'Xbox'), 350.00, 399.00, 100),
((SELECT id_videojuegos FROM videojuegos WHERE titulo = 'Red Dead Redemption 2'), (SELECT id_plataformas FROM plataformas WHERE nombre = 'Xbox'), 450.00, 499.00, 100);

-- Insertar datos en la tabla de relación videojuego_plataforma para PlayStation
<<<<<<< HEAD
INSERT INTO videojuegos_plataformas (id_videojuegos, id_plataformas, costo, precio, stock)
=======
INSERT INTO videojuego_plataformas (id_videojuego, id_plataforma, costo, precio, stock)
>>>>>>> 4a2402ebab24398edce9069436771a6d4c4e27dd
VALUES 
((SELECT id_videojuegos FROM videojuegos WHERE titulo = 'Elden Ring'), (SELECT id_plataformas FROM plataformas WHERE nombre = 'PlayStation'), 450.00, 499.00, 100),
((SELECT id_videojuegos FROM videojuegos WHERE titulo = 'God of War Ragnarok'), (SELECT id_plataformas FROM plataformas WHERE nombre = 'PlayStation'), 450.00, 499.00, 100),
((SELECT id_videojuegos FROM videojuegos WHERE titulo = 'GTA V'), (SELECT id_plataformas FROM plataformas WHERE nombre = 'PlayStation'), 450.00, 499.00, 100),
((SELECT id_videojuegos FROM videojuegos WHERE titulo = 'Resident Evil 4'), (SELECT id_plataformas FROM plataformas WHERE nombre = 'PlayStation'), 450.00, 499.00, 100),
((SELECT id_videojuegos FROM videojuegos WHERE titulo = 'The Last of Us 2'), (SELECT id_plataformas FROM plataformas WHERE nombre = 'PlayStation'), 450.00, 499.00, 100);

-- Insertar datos en la tabla de relación videojuego_plataforma para Nintendo
<<<<<<< HEAD
INSERT INTO videojuegos_plataformas (id_videojuegos, id_plataformas, costo, precio, stock)
=======
INSERT INTO videojuego_plataformas (id_videojuego, id_plataforma, costo, precio, stock)
>>>>>>> 4a2402ebab24398edce9069436771a6d4c4e27dd
VALUES 
((SELECT id_videojuegos FROM videojuegos WHERE titulo = 'Cuphead'), (SELECT id_plataformas FROM plataformas WHERE nombre = 'Nintendo'), 350.00, 399.00, 100),
((SELECT id_videojuegos FROM videojuegos WHERE titulo = 'Mario Bros'), (SELECT id_plataformas FROM plataformas WHERE nombre = 'Nintendo'), 350.00, 399.00, 100),
((SELECT id_videojuegos FROM videojuegos WHERE titulo = 'Splatoon 3'), (SELECT id_plataformas FROM plataformas WHERE nombre = 'Nintendo'), 250.00, 299.00, 100),
((SELECT id_videojuegos FROM videojuegos WHERE titulo = 'Super Smash Bros'), (SELECT id_plataformas FROM plataformas WHERE nombre = 'Nintendo'), 450.00, 499.00, 100),
((SELECT id_videojuegos FROM videojuegos WHERE titulo = 'The Legend of Zelda'), (SELECT id_plataformas FROM plataformas WHERE nombre = 'Nintendo'), 450.00, 499.00, 100);
