from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import create_engine, text
from sqlalchemy.exc import SQLAlchemyError

QUERY_TODOS_LOS_PERSONAJES = "SELECT ID, nombre, edad, region, elemento FROM personaje"

QUERY_PERSONAJE_BY_ID = "SELECT nombre, edad, region, elemento FROM personaje WHERE ID = :ID"

QUERY_ADD_PERSONAJE = "INSERT INTO personaje (nombre, edad, region, elemento) VALUES (:nombre, :edad, :region, :elemento)"

QUERY_UPDATE_PERSONAJE = "UPDATE personaje SET nombre = COALESCE(:nombre, nombre), edad = COALESCE(:edad, edad), region = COALESCE(:region, region), elemento = COALESCE(:elemento, elementos) WHERE ID = :id"

QUERY_DELETE_PERSONAJE = "DELETE FROM personaje WHERE ID = :=id"

engine = create_engine("mysql+mysqlconnector://root@localhost:3306/test")

def run_query(query, parameters=None):
  with engine.connect() as conn:
    result = conn.execute(text(query), parameters)
    return result

def all_personajes():
  return run_query(QUERY_TODOS_LOS_PERSONAJES).fetchall()

def personaje_by_id(id):
  return run_query(QUERY_PERSONAJE_BY_ID, {'ID': id}).fetchall()

def add_personaje(nombre, edad, region, elemento):
  run_query(QUERY_ADD_PERSONAJE, {'nombre': nombre, 'edad': edad, 'region': region, 'elemento': elemento})
  return {"message": "Personaje creado"}

def update_personaje(id, nombre=None, edad=None, region=None, elemento=None):
  result = run_query(QUERY_UPDATE_PERSONAJE, {'id': id, 'nombre': nombre, 'edad': edad, 'region': region, 'elemento': elemento})
  if result.rowcount == 0:
      return {"error": "Personaje no encontrado"}
  return {"message": "Personaje actualizado"}

def delete_personaje(id):
  try:
    result = run_query(QUERY_DELETE_PERSONAJE,{'id':id})
    if result.rowcount == 0:
      return {"error": "Personaje no encontrado"}
    return {"message": "Personaje eliminado"}
  except SQLAlchemyError as e:
    return {"error": str(e)}
