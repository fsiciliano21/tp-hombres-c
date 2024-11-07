USE db_name;

create table personaje(
  nombre varchar(50) not null,
  edad int not null,
  region varchar(50) not null,
  elemento varchar(50) not null,
);

create table stats(
  vida int not null,
  ataque int not null,
  defensa int not null,
);

create table proposito(
  maestria varchar(50) not null,
  recarga int not null,
  critico int not null,
);

create table arma(
  nivel int not null,
  refinamiento int not null,
);

create table taletos(
  ataque int not null,
  elemental varchar(50) not null,
  ultimate int not null,
);
