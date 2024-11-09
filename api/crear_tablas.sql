USE db_name;

CREATE TABLE personaje(
  ID INT AUTO_INCREMENT PRIMARY KEY,
  nombre varchar(50) NOT NULL,
  edad INT NOT NULL,
  region varchar(50) NOT NULL,
  elemento varchar(50) NOT NULL
);

CREATE TABLE stats_principales(
  ID INT NOT NULL,
  vida INT NOT NULL,
  ataque INT NOT NULL,
  defensa INT NOT NULL,
  maestria INT NOT NULL,
  recarga_energia INT NOT NULL,
  probabilidad_critico INT NOT NULL,
  danio_critico INT NOT NULL,
  FOREIGN KEY(ID) REFERENCES personaje(ID),
  PRIMARY KEY(ID)
);

CREATE TABLE arma(
  ID INT NOT NULL,
  nivel INT NOT NULL,
  refinamiento INT NOT NULL,
  FOREIGN KEY(ID) REFERENCES personaje(ID),
  PRIMARY KEY(ID)
);

CREATE TABLE talentos(
  ID INT NOT NULL,
  ataque INT NOT NULL,
  elemental INT NOT NULL,
  ultimate INT NOT NULL,
  FOREIGN KEY(ID) REFERENCES personaje(ID),
  PRIMARY KEY(ID)
);
