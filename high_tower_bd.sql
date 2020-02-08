CREATE DATABASE  HighTower_bd

USE HighTower_bd
go


create table condominios_tb(
con_id int identity(1,1) primary key not null,
cta_cuentaban varchar(20) foreign key references cuentas_bancarias_tb(cta_cuentaban),
con_nombre varchar(50) not null,
con_calle varchar(50) not null,
con_colonia varchar(50) not null,
con_municipio varchar(50) not null,
con_estado varchar(50) not null,
con_activo bit not null)

create table tipo_movimientos_tb(
tmo_id int identity(1,1) not null primary key,
tmo_descripcion varchar(50))

CREATE TABLE saldos_tb(
sal_id int identity(1,1) primary key not null, 
tmo_id int foreign key references tipo_movimientos_tb(tmo_id),
con_id int foreign key references condominios_tb(con_id),
via_id varchar(3) foreign key references vias_pago_tb(via_id),
sal_cradopor varchar(20) not null,
sal_fechacreacion date not null,
sal_fechamodif date not null,
sal_modifpor varchar(20) not null,
sal_ejercicio varchar(4) not null,
sal_periodo varchar(2) not null,
sal_monto money not null)

create table departamentos_tb(
dep_id int identity(1,1) primary key not null,
con_id  int foreign key references condominios_tb(con_id),
dep_numero varchar(4) not null,
dep_activo bit not null
)

create table tipo_usuarios_tb(
tus_id int identity(1,1) primary key not null,
tus_descripcion varchar(100) not null,
tus_activo bit not null)

create table usuarios_tb(
usu_name varchar(20) primary key not null,
tus_id  int foreign key references tipo_usuarios_tb(tus_id),
usu_nombre varchar(100) not null,
usu_apellidopaterno varchar(100) not null,
usu_apellidomaterno varchar(100) not null,
usu_email varchar(100) not null,
usu_activo bit not null)

Create table cuentas_bancarias_tb(
cta_cuentaban varchar(20) not null primary key,
cta_banco varchar(50) not null, 
cta_activo bit not null)

create table vias_pago_tb(
via_id varchar(3) not null primary key,
via_descripcion varchar(20) not null)
