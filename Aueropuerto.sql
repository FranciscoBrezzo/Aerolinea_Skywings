create database aeropuertoSkywings;
use aeropuertoSkywings;

create table equipaje(
id int AUTO_INCREMENT primary key,
peso int
);

create table ubicaciones_actual(
id int AUTO_INCREMENT primary key,
nombre varchar(30)
);

create table vuelo(
id int AUTO_INCREMENT primary key,
modelo_avion varchar(30),
aerolinea varchar(30),
status varchar(30),
origen varchar(30),
destino varchar(30),
fecha_partida datetime,
fecha_llegada datetime,
puerta_embarque int,
boletos_vendidos int,
ubicacion_id int,
constraint foreign key (ubicacion_id) references ubicaciones_actual(id)
);

create table boleto(
id int AUTO_INCREMENT primary key,
nro_asiento int,
vuelo_id int,
constraint foreign key (vuelo_id) references vuelo(id)
);

create table pasajero(
id int AUTO_INCREMENT primary key,
nombre varchar(30),
apellido varchar(30),
nro_pasaporte int,
boleto_id int,
equipaje_id int,
constraint foreign key (boleto_id) references boleto(id),
constraint foreign key (equipaje_id) references equipaje(id)
);



insert into equipaje(peso) values('100');
insert into equipaje(peso) values('50');
insert into equipaje(peso) values('25');
insert into equipaje(peso) values('70');
insert into equipaje(peso) values('10');



insert into ubicaciones_actual(nombre) values('Dinamarca');
insert into ubicaciones_actual(nombre) values('Argentina');
insert into ubicaciones_actual(nombre) values('Peru');
insert into ubicaciones_actual(nombre) values('Chile');
insert into ubicaciones_actual(nombre) values('España');



insert into vuelo(modelo_avion,aerolinea,status,origen,destino,fecha_partida,fecha_llegada,puerta_embarque,boletos_vendidos,ubicacion_id) values('caza-43','LATAM','saliendo','Argentina','Peru','2023-01-05 10:15.00','2023-01-06 10:15.00','2','400','3');
insert into vuelo(modelo_avion,aerolinea,status,origen,destino,fecha_partida,fecha_llegada,puerta_embarque,boletos_vendidos,ubicacion_id) values('Boeing-747','TEOOO','cancelado','Chile','España','2021-04-21 17:04.00','2021-04-24 10:15.00','5','100','4');
insert into vuelo(modelo_avion,aerolinea,status,origen,destino,fecha_partida,fecha_llegada,puerta_embarque,boletos_vendidos,ubicacion_id) values('Airbus-320','JUAAN','llego','Dinamarca','Peru','2022-11-15 10:15.00','2022-11-26 10:15.00','1','250','1');
insert into vuelo(modelo_avion,aerolinea,status,origen,destino,fecha_partida,fecha_llegada,puerta_embarque,boletos_vendidos,ubicacion_id) values('Boeing 777-200','LAS','en vuelo','Argentina','Dinamarca','2023-12-05 22:15.00','2023-12-10 10:15.00','5','500','1');
insert into vuelo(modelo_avion,aerolinea,status,origen,destino,fecha_partida,fecha_llegada,puerta_embarque,boletos_vendidos,ubicacion_id) values('caza-43','LATAM','llego','Peru','Argentina','2023-01-05 10:15.00','2023-01-06 10:15.00','3','200','2');



insert into boleto(nro_asiento,vuelo_id) values('43','1');
insert into boleto(nro_asiento,vuelo_id) values('55','1');
insert into boleto(nro_asiento,vuelo_id) values('22','2');
insert into boleto(nro_asiento,vuelo_id) values('01','2');
insert into boleto(nro_asiento,vuelo_id) values('10','3');



insert into pasajero(nombre,apellido,nro_pasaporte,boleto_id,equipaje_id) values('Pepe','Rodriguez','23939192','1','2');
insert into pasajero(nombre,apellido,nro_pasaporte,boleto_id,equipaje_id) values('Julian','Lopez','43242342','2','1');
insert into pasajero(nombre,apellido,nro_pasaporte,boleto_id,equipaje_id) values('Francisco','Brezzo','45549192','3','4');
insert into pasajero(nombre,apellido,nro_pasaporte,boleto_id,equipaje_id) values('Bautista','Cimatti','23934343','5','3');
insert into pasajero(nombre,apellido,nro_pasaporte,boleto_id,equipaje_id) values('Tomas','Martiarena','45542332','4','5');







