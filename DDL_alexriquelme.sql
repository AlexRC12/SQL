--Creación del esquema
create schema alexmaster authorization hyviflsi

--Creación tabla "colores"
create table alexmaster.colores(
	idcolor varchar(20) not null, -- PK
	nombre_color varchar(20) not null
);

--Añadiendo PK a la tabla "colores"
alter table alexmaster.colores
add constraint colores_PK primary key (idcolor);

--Carga datos a la tabla "colores"
insert into alexmaster.colores 
(idcolor, nombre_color)
values(1, 'Rojo');

insert into alexmaster.colores 
(idcolor, nombre_color)
values(2, 'Azul');

insert into alexmaster.colores 
(idcolor, nombre_color)
values(3, 'Gris');

insert into alexmaster.colores 
(idcolor, nombre_color)
values(4, 'Blanco');

--Creación tabla "Aseguradoras"
create table alexmaster.aseguradoras(
	idaseguradora varchar(20) not null, --PK 
	nombre_aseguradora varchar(20) not null
);

--Añadiendo PK a la tabla "Aseguradoras"
alter table alexmaster.aseguradoras 
add constraint aseguradoras_PK primary key (idaseguradora);

--Carga datos a la tabla "Asegurados"
insert into alexmaster.aseguradoras 
(idaseguradora, nombre_aseguradora)
values(1, 'Mapfre');

insert into alexmaster.aseguradoras 
(idaseguradora, nombre_aseguradora)
values(2, 'MMT');

insert into alexmaster.aseguradoras 
(idaseguradora, nombre_aseguradora)
values(3, 'AXA');


--Creación tabla "Polizas"
create table alexmaster.polizas(
	idpoliza varchar(20) not null,  --PK
	idaseguradora varchar(20) not null,  --FK
	nro_poliza varchar(20) not null
);

--Añadiendo PK a la tabla "Polizas"
alter table alexmaster.polizas 
add constraint polizas_PK primary key (idpoliza);

--Añadiendo FK a la tabla "Polizas"
alter table alexmaster.polizas 
add constraint polizas_idaseguradora_FK foreign key (idaseguradora)
references alexmaster.aseguradoras(idaseguradora);

--Carga datos a la tabla "Polizas"
insert into alexmaster.polizas 
(idpoliza, idaseguradora, nro_poliza)
values(1,1,'P00001');

insert into alexmaster.polizas 
(idpoliza, idaseguradora, nro_poliza)
values(2,2,'P00002');

insert into alexmaster.polizas 
(idpoliza, idaseguradora, nro_poliza)
values(3,2,'P00003');

insert into alexmaster.polizas 
(idpoliza, idaseguradora, nro_poliza)
values(4,3,'P00010');

--Creación tabla "Estado Coche"
create table alexmaster.estadocoche(
	idestado varchar(20) not null, --PK
	estado varchar(20) not null
);


--Añadiendo PK a la tabla  "Estado Coche"
alter table alexmaster.estadocoche
add constraint estadocoche_PK primary key (idestado);

--Carga datos a la tabla "Estado Coche"
insert into alexmaster.estadocoche
(idestado, estado)
values(1,'Activo');

insert into alexmaster.estadocoche
(idestado, estado)
values(2,'Inactivo');

insert into alexmaster.estadocoche
(idestado, estado)
values(3,'No especificado');


--Creación tabla "Coches"
create table alexmaster.coches(
	idcoche varchar(20) not null, --PK
	idmodelo varchar(20) not null, --FK
	idcolor varchar(20) not null, --FK
	matricula varchar(20) not null,
	kilometros varchar(20) not null, 
	idpoliza varchar(20) not null, --FK
	fechacompra date not null, 
	idrevisiones varchar(20) not null, --PK
	estado varchar(20) not null, --FK
	fechabaja date null default '4000-01-01'
);


--Añadiendo PK a la tabla "Coches"
alter table alexmaster.coches 
add constraint coches_PK primary key (idcoche,idrevisiones); --Llave primaria compuesta


--Añadiendo FK de la tabla "colores" a la tabla "coches"
alter table alexmaster.coches 
add constraint coches_colores_FK foreign key (idcolor)
references alexmaster.colores(idcolor);


--Añadiendo FK de la tabla "polizas" a la tabla "coches"
alter table alexmaster.coches 
add constraint coches_polizas_FK foreign key (idpoliza)
references alexmaster.polizas(idpoliza);

--Añadiendo FK de la tabla "estadocoche" a la tabla "coches"
alter table alexmaster.coches 
add constraint coches_estadocoche_FK foreign key (estado)
references alexmaster.estadocoche(idestado);



--Creación tabla "Grupo empresarial"
create table alexmaster.grupoempresarial(
	idgrupoempresarial varchar(20) not null, --PK
	nombregrupo varchar(20) not null
);

--Añadir PK a la tabla grupo empresarial
alter table alexmaster.grupoempresarial
add constraint grupoempresarial_PK primary key (idgrupoempresarial);

--Añadir datos a la tabla grupo empresarial
insert into alexmaster.grupoempresarial
(idgrupoempresarial, nombregrupo)
values(1, 'Grupo VW');

insert into alexmaster.grupoempresarial
(idgrupoempresarial, nombregrupo)
values(2, 'Grupo Toyota');

insert into alexmaster.grupoempresarial
(idgrupoempresarial, nombregrupo)
values(3, 'Grupo Nissan');


--Creación tabla "Marcas"
create table alexmaster.marcas(
	idmarca varchar(20) not null,
	idgrupoempresarial varchar(20) not null,
	nombremarca varchar(20) not null
);

--Añadiendo PK a la tabla marcas
alter table alexmaster.marcas
add constraint marcas_PK primary key (idmarca);

--Añadiendo FK a tabla marcas
alter table alexmaster.marcas 
add constraint marcas_grupoempresarial_FK foreign key (idgrupoempresarial)
references alexmaster.grupoempresarial(idgrupoempresarial);

--Añadir datos a la tabla marcas
insert into alexmaster.marcas 
(idmarca, idgrupoempresarial,nombremarca)
values(1,1,'Audi');

insert into alexmaster.marcas 
(idmarca, idgrupoempresarial,nombremarca)
values(2,1,'SEAT');

insert into alexmaster.marcas 
(idmarca, idgrupoempresarial,nombremarca)
values(3,1,'Volskwagen');


insert into alexmaster.marcas 
(idmarca, idgrupoempresarial,nombremarca)
values(4,2,'Toyota');

insert into alexmaster.marcas 
(idmarca, idgrupoempresarial,nombremarca)
values(5,2,'Lexus');


insert into alexmaster.marcas 
(idmarca, idgrupoempresarial,nombremarca)
values(6,3,'Nissan');

insert into alexmaster.marcas 
(idmarca, idgrupoempresarial,nombremarca)
values(7,3,'Renault');

insert into alexmaster.marcas 
(idmarca, idgrupoempresarial,nombremarca)
values(8,3,'Mitsubishi');


--Creación tabla "Modelos"
create table alexmaster.modelos(
	idmodelo varchar(20) not null, --PK
	idmarca varchar(20) not null, --FK
	nombremodelo varchar(20) not null,
	aniomodelo varchar(4) not null
);

--Añadiendo PK a la tabla modelos
alter table alexmaster.modelos
add constraint modelos_PK primary key (idmodelo);


--Añadiendo FK a la tabla modelos
alter table alexmaster.modelos 
add constraint modelos_marcas_FK foreign key(idmarca)
references alexmaster.marcas(idmarca);


--Modelos audi
insert into alexmaster.modelos 
(idmodelo, idmarca, nombremodelo, aniomodelo)
values(1,1,'A3','2022');

insert into alexmaster.modelos 
(idmodelo, idmarca, nombremodelo, aniomodelo)
values(2,1,'A4','2022');

insert into alexmaster.modelos 
(idmodelo, idmarca, nombremodelo, aniomodelo)
values(3,1,'A5','2022');

--Modelos SEAT
insert into alexmaster.modelos 
(idmodelo, idmarca, nombremodelo, aniomodelo)
values(4,2,'Ibiza','2022');

insert into alexmaster.modelos 
(idmodelo, idmarca, nombremodelo, aniomodelo)
values(5,2,'León','2022');

insert into alexmaster.modelos 
(idmodelo, idmarca, nombremodelo, aniomodelo)
values(6,2,'Ateca','2022');

--Modelos Volskwagen
insert into alexmaster.modelos 
(idmodelo, idmarca, nombremodelo, aniomodelo)
values(7,3,'Gol','2022');

insert into alexmaster.modelos 
(idmodelo, idmarca, nombremodelo, aniomodelo)
values(8,3,'Polo','2022');

insert into alexmaster.modelos 
(idmodelo, idmarca, nombremodelo, aniomodelo)
values(9,3,'Voyage','2022');


--Modelos Toyota
insert into alexmaster.modelos 
(idmodelo, idmarca, nombremodelo, aniomodelo)
values(10,4,'Yaris','2022');

insert into alexmaster.modelos 
(idmodelo, idmarca, nombremodelo, aniomodelo)
values(11,4,'Corolla','2022');

insert into alexmaster.modelos 
(idmodelo, idmarca, nombremodelo, aniomodelo)
values(12,4,'Rav4','2022');

--Modelos Lexus

insert into alexmaster.modelos 
(idmodelo, idmarca, nombremodelo, aniomodelo)
values(13,5,'Rx','2022');

insert into alexmaster.modelos 
(idmodelo, idmarca, nombremodelo, aniomodelo)
values(14,5,'Ls','2022');

insert into alexmaster.modelos 
(idmodelo, idmarca, nombremodelo, aniomodelo)
values(15,5,'Is','2022');

--Modelos Nissan

insert into alexmaster.modelos 
(idmodelo, idmarca, nombremodelo, aniomodelo)
values(16,6,'Murano','2022');

insert into alexmaster.modelos 
(idmodelo, idmarca, nombremodelo, aniomodelo)
values(17,6,'Qashqai','2022');

insert into alexmaster.modelos 
(idmodelo, idmarca, nombremodelo, aniomodelo)
values(18,6,'Sentra','2022');

--Modelos Renault

insert into alexmaster.modelos 
(idmodelo, idmarca, nombremodelo, aniomodelo)
values(19,7,'CLIO','2022');

insert into alexmaster.modelos 
(idmodelo, idmarca, nombremodelo, aniomodelo)
values(20,7,'MEGANE','2022');

insert into alexmaster.modelos 
(idmodelo, idmarca, nombremodelo, aniomodelo)
values(21,7,'KWID','2022');

--Modelos Mitsubishi
insert into alexmaster.modelos 
(idmodelo, idmarca, nombremodelo, aniomodelo)
values(22,8,'Outlander','2022');

insert into alexmaster.modelos 
(idmodelo, idmarca, nombremodelo, aniomodelo)
values(23,8,'Eclipse','2022');

insert into alexmaster.modelos 
(idmodelo, idmarca, nombremodelo, aniomodelo)
values(24,8,'L200','2022');



--Creación tabla "Monedas"

create table alexmaster.monedas(
	idmoneda varchar(20) not null,  --PK
	nombremoneda varchar(10) not null
);


--Añadiendo primary key a la tabla monedas
alter table alexmaster.monedas
add constraint monedas_PK primary key (idmoneda);

--Añadiendo datos a la tabla monedas
insert into alexmaster.monedas
(idmoneda, nombremoneda)
values(1,'Dolar US');

insert into alexmaster.monedas
(idmoneda, nombremoneda)
values(2,'Euro');

insert into alexmaster.monedas
(idmoneda, nombremoneda)
values(3,'Peso Chile');


--Creación tabla "Revisiones"
create table alexmaster.revisiones(
	idrevisiones varchar(10) not null, --PK
	fecharevision date null default '4000-01-01',
	kmrevisiones varchar(10) null,
	importe varchar(20) null,
	idmoneda varchar(20) not null
);

--Añadiendo primary key a la tabla "Revisiones"
alter table alexmaster.revisiones
add constraint revisiones_PK primary key (idrevisiones);

--Añadiendo llave foranea a la tabla "Revisiones"
alter table alexmaster.revisiones
add constraint revisiones_monedas_FK foreign key (idmoneda)
references alexmaster.monedas(idmoneda);

--Añadiendo datos a la tabla "Revisiones"

insert into alexmaster.revisiones 
(idrevisiones, fecharevision,kmrevisiones,importe,idmoneda)
values(1,'2022-02-01','10000','1000',1);

insert into alexmaster.revisiones 
(idrevisiones, fecharevision,kmrevisiones,importe,idmoneda)
values(2,'2022-03-01','10000','1000',1);

insert into alexmaster.revisiones 
(idrevisiones, fecharevision,kmrevisiones,importe,idmoneda)
values(3,'2022-04-30','5000','800',1);

insert into alexmaster.revisiones 
(idrevisiones, fecharevision,kmrevisiones,importe,idmoneda)
values(4,'2022-06-05','2000','500',1);


insert into alexmaster.revisiones 
(idrevisiones, fecharevision,kmrevisiones,importe,idmoneda)
values(5,'2018-12-15','50000','2000',1);

insert into alexmaster.revisiones 
(idrevisiones, fecharevision,kmrevisiones,importe,idmoneda)
values(6,'2020-06-05','40000','3000',1);



--Creación tabla coches-revisiones
create table alexmaster.coches_revisiones(
	idcoche varchar(20) not null, --PK,FK
	idrevisiones varchar (10) not null, --PK,FK
	descripcion varchar(50) null
);

--Añadiendo primary key a la tabla coches_revisiones
alter table alexmaster.coches_revisiones 
add constraint coches_revisiones_PK primary key (idcoche, idrevisiones);


--Añadiendo llave foranea a la tabla coches_revisiones
alter table alexmaster.coches_revisiones 
add constraint coches_revisiones_REVISIONES_FK foreign key (idrevisiones)
references alexmaster.revisiones(idrevisiones);



--Añadir llave foranea a la tabla coches (idmodelo)
alter table alexmaster.coches 
add constraint coches_modelos_FK foreign key (idmodelo)
references alexmaster.modelos(idmodelo);

--AÑADIR LLAVE FORANEA coches_revisiones en el campo idcoche
alter table alexmaster.coches_revisiones 
add constraint coches_revisiones_COCHES_FK foreign key (idcoche,idrevisiones)  --Llave foreanea compuesta para conectar con la llave primaria compuesta de la tabla coches
references alexmaster.coches(idcoche, idrevisiones);





--Agregando datos a la tabla coches

insert into alexmaster.coches 
(idcoche,idmodelo,idcolor,matricula,kilometros,idpoliza,fechacompra,idrevisiones,estado,fechabaja)
values(1,1,3,'1234CL',5000,1,'2021-01-30',3,1,DEFAULT);
--coche 1,Audi A3, gris, matricula 1234CL, km recorridos 5000, poliza 1 =P00001, fecha compra 2021-01-30, idrevision = 3,estado activo,

insert into alexmaster.coches 
(idcoche,idmodelo,idcolor,matricula,kilometros,idpoliza,fechacompra,idrevisiones,estado,fechabaja)
values(2,5,4,'5678ES',10000,2,'2020-12-01',2,1,DEFAULT);
--coche 2,SEAT León,blanco, matricula 5678ES, km recorridos 10000, poliza 2 = P00002, fecha compra 2020-12-01,idrevisiones =2, estado activo
insert into alexmaster.coches 
(idcoche,idmodelo,idcolor,matricula,kilometros,idpoliza,fechacompra,idrevisiones,estado,fechabaja)
values(3,24,1,'9123MX',12000,3,'2020-08-12',1,1,DEFAULT);
--coche 3, Mitsubishi L200, Rojo, matricula 9123MX, km recorridos 12000, poliza 3 = P00003,fecha compra 2020-08-12,idrevisiones = 1, estado activo
insert into alexmaster.coches 
(idcoche,idmodelo,idcolor,matricula,kilometros,idpoliza,fechacompra,idrevisiones,estado,fechabaja)
values(4,1,3,'1234CL',7000,1,'2021-01-30',3,1,DEFAULT);
--coche 4, Audi A3, color gris, matricula 2021-01-30, km recorridos 7000, poliza1 =P00001,fecha compra 2021-01-30, idrevisiones = 3,estado activo

insert into alexmaster.coches 
(idcoche,idmodelo,idcolor,matricula,kilometros,idpoliza,fechacompra,idrevisiones,estado,fechabaja)
values(5,10,3,'0010CL',50000,4,'2018-09-01',5,2,'2022-12-30');---------
--coche 5, Toyota Yaris,color gris, matricula 0010CL, km recorridos 50000, poliza4 = P00004, fecha compra 2018-09-01, idrevisiones= 5, estado inactivo


--Falta agregar datos a la tabla coches_revisiones
insert into alexmaster.coches_revisiones 
(idcoche,idrevisiones,descripcion)
values(1,3,'Revisión de 5000 KM, aplica cambio de aceite motor');

insert into alexmaster.coches_revisiones 
(idcoche,idrevisiones,descripcion)
values(4,3,'Revisión de 7000 KM, aplica cambio de agua verde');













