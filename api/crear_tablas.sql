USE db_name;

create table personaje(
  nombre varchar(50) not null,
  edad int not null,
  region varchar(50) not null,
  elemento varchar(50) not null,
);

create table stats_principales(
  vida int not null,
  ataque int not null,
  defensa int not null,
  maestria int not null,
  recarga_energia int not null,
  probabilidad_critico int not null,
  danio_critico int not null,
);

create table arma(
  nivel int not null,
  refinamiento int not null,
);

create table talentos(
  ataque int not null,
  elemental varchar(50) not null,
  ultimate int not null,
);
