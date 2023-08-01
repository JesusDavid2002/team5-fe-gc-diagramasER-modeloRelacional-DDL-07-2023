USE ejercicio18;

CREATE TABLE clientes (
	DNI varchar(9),
    nombre varchar(15) not null,
    apellidos varchar(20),
    teléfono_fijo int,
    móvil int,
    código_personal int not null,
    PRIMARY KEY (DNI)
);

CREATE TABLE trabajadores (
	DNI varchar(9),
    nombre varchar(15) not null,
    apellidos varchar(20),
    teléfono_fijo int,
    móvil int,
    código_personal int not null,
    DNI_clientes varchar(9),
    PRIMARY KEY (DNI),
    FOREIGN KEY (DNI_clientes) REFERENCES clientes(DNI)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE inmuebles (
	código_inmueble int,
    metros float,
    descripción varchar(50),
    dirección varchar(25),
    PRIMARY KEY (código_inmueble)
);

CREATE TABLE locales (
	código_local int,
    uso varchar(50),
    tieneServicio boolean,
    código_inmuebles int,
    PRIMARY KEY (código_local, código_inmuebles),
    FOREIGN KEY (código_inmuebles) REFERENCES inmuebles(código_inmueble)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE pisos (
	código_especial int,
    código_inmuebles int,
    PRIMARY KEY (código_especial, código_inmuebles),
    FOREIGN KEY (código_inmuebles) REFERENCES inmuebles(código_inmueble)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE garajes (
	código_local int,
    número_garaje int,
    planta int,
    código_inmuebles int,
    código_piso int,
    PRIMARY KEY (código_local, código_inmuebles),
    FOREIGN KEY (código_inmuebles) REFERENCES inmuebles(código_inmueble)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (código_piso) REFERENCES pisos(código_especial)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE titulares (
	titularID int,
    nombre varchar (15),
    apellidos varchar (20),
    PRIMARY KEY (titularID)
);

CREATE TABLE comprar (
	código_compra int,
    fecha date,
    valor_compra float,
    DNI_clientes varchar(9),
    código_inmuebles int,
    titularID int,
    PRIMARY KEY (código_compra),
    FOREIGN KEY (DNI_clientes) REFERENCES clientes(DNI)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (código_inmuebles) REFERENCES inmuebles(código_inmueble)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (titularID) REFERENCES titulares(titularID)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE pagos (
	código_pago_alquiler int,
    año int,
    mes int,
    valor float,
    número_alquiler int,
    nombre_agente varchar(15),
    DNI_clientes varchar(9),
    código_inmuebles int,
    PRIMARY KEY (código_pago_alquiler),
    FOREIGN KEY (DNI_clientes) REFERENCES clientes(DNI)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (código_inmuebles) REFERENCES inmuebles(código_inmueble)
    ON DELETE cascade
    ON UPDATE cascade
);

