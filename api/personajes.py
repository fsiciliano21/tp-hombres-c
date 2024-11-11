from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import create_engine
from sqlalchemy import text
from sqlalchemy.exc import SQLAlchemyError

QUERY_TODOS_LOS_PERSONAJES = "SELECT ID, nombre, edad, region, elemento FROM personaje"

QUERY_PERSONAJE_BY_ID = "SELECT nombre, edad, region, elemento FROM alumnos WHERE ID = :ID"

engine = create_engine("mysql+mysqlconnector://root@localhost:3306/test")

def run_query(query, parameters=None):
  with engine.connect() as conn:
    result = conn.execute(text(query), parameters)
    conn.commit()

  return result

def all_personajes():
  return run_query(QUERY_TODOS_LOS_PERSONAJES).fetchall()

def personaje_by_id(id):
  return run_query(QUERY_PERSONAJE_BY_ID, {'ID': id}).fetchall()
