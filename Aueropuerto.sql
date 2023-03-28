create database aeropuertoSkywings;
use aeropuertoSkywings;

create table equipaje(
id int AUTO_INCREMENT primary key,
peso int
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
boletos_vendidos int
);

create table ubicacion_actual(
vuelo_id int,
ubicacion varchar(30),
constraint foreign key (vuelo_id) references vuelo(id)
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



insert into vuelo(modelo_avion,aerolinea,status,orADD(NOW(),
INTERVAL 2 DAY);
Empty set (0,00 sec)
igen,destino,fecha_partida,fecha_llegada,puerta_embarque,boletos_vendidos) values('caza-43','LATAM','saliendo','Argentina','Peru','2023-01-05 10:15.00','2023-01-06 10:15.00','2','400');
insert into vuelo(modelo_avion,aerolinea,status,origen,destino,fecha_partida,fecha_llegada,puerta_embarque,boletos_vendidos) values('Boeing-747','TEOOO','cancelado','Chile','España','2021-04-21 17:04.00','2021-04-24 10:15.00','5','100');
insert into vuelo(modelo_avion,aerolinea,status,origen,destino,fecha_partida,fecha_llegada,puerta_embarque,boletos_vendidos) values('Airbus-320','JUAAN','llego','Dinamarca','Peru','2022-11-15 10:15.00','2022-11-26 10:15.00','1','250');
insert into vuelo(modelo_avion,aerolinea,status,origen,destino,fecha_partida,fecha_llegada,puerta_embarque,boletos_vendidos) values('Boeing 777-200','LAS','en vuelo','Argentina','Dinamarca','2023-12-05 22:15.00','2023-12-10 10:15.00','5','500');
insert into vuelo(modelo_avion,aerolinea,status,origen,destino,fecha_partida,fecha_llegada,puerta_embarque,boletos_vendidos) values('caza-43','LATAM','llego','Peru','Argentina','2023-01-05 10:15.00','2023-01-06 10:15.00','3','200');
insert into vuelo(modelo_avion,aerolinea,status,origen,destino,fecha_partida,fecha_llegada,puerta_embarque,boletos_vendidos) values('caza-43','LATAM','llego','Peru','Argentina','2023-03-27 19:15.00','2023-01-06 10:15.00','3','200');
insert into vuelo(modelo_avion,aerolinea,status,origen,destino,fecha_partida,fecha_llegada,puerta_embarque,boletos_vendidos) values('caza-43','LATAM','llego','Peru','Dinamarca','2023-03-27 19:15.00','2023-01-06 10:15.00','3','200');


insert into ubicacion_actual(vuelo_id,ubicacion) values('1','Dinamarca');
insert into ubicacion_actual(vuelo_id,ubicacion) values('1','Argentina');
insert into ubicacion_actual(vuelo_id,ubicacion) values('2','Peru');
insert into ubicacion_actual(vuelo_id,ubicacion) values('2','Chile');
insert into ubicacion_actual(vuelo_id,ubicacion) values('2','España');

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


SELECT vuelo.id, vuelo.modelo_avion, vuelo.fecha_partida, ubicacion_actual.ubicacion
FROM ubicacion_actual
INNER JOIN vuelo on ubicacion_actual.vuelo_id = vuelo.id
WHERE fecha_partida < DATE_ADD(NOW(), INTERVAL 5 HOUR) AND fecha_partida >= NOW() ORDER BY id DESC LIMIT 1;

SELECT AVG(peso) AS promedio , MAX(peso) AS mas_pesado, MIN(peso) AS mas_liviano  
FROM equipaje;

SELECT CONCAT_WS(' ', pasajero.nombre, pasajero.apellido) AS pasajero, GROUP_CONCAT(ubicacion_actual.ubicacion SEPARATOR ',') AS historial
FROM vuelo
LEFT JOIN boleto ON vuelo.id = boleto.vuelo_id
INNER JOIN pasajero ON boleto.id = boleto.vuelo_id 
LEFT JOIN ubicacion_actual ON vuelo.id = ubicacion_actual.vuelo_id
WHERE vuelo.destino = 'Dinamarca'
AND vuelo.fecha_llegada BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 2 DAY)
GROUP BY vuelo.id, boleto.id;

SELECT COUNT(id) as visitas, destino, AVG(boletos_vendidos) AS promedio_pasajeros, MAX(boletos_vendidos) AS max_pasajeros from vuelo GROUP BY destino ORDER BY COUNT(id) DESC;

SELECT vuelo.destino AS ubicacion, 
COUNT(boleto.id) AS total_reservas, 
SUM(vuelo.status = 'cancelado' ) AS canceladas,
SUM(vuelo.status = 'llego' ) AS exitosas
FROM vuelo
INNER JOIN boleto ON vuelo.id = boleto.vuelo_id
GROUP BY vuelo.destino;


