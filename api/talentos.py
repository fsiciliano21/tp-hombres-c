from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import create_engine, text
from sqlalchemy.exc import SQLAlchemyError

QUERY_TODOS_LOS_TALENTOS = "SELECT id, ataque, elemental, ultimate FROM talentos"

QUERY_TALENTOS_BY_ID = "SELECT ataque, elemental, ultimate FROM talentos WHERE ID = :id"

QUERY_ADD_TALENTOS = "INSERT INTO talentos (id, ataque, elemental, ultimate) VALUES (:id, :ataque, :elemental, :ultimate)"

QUERY_UPDATE_TALENTOS = """
UPDATE talentos
SET
  ataque = COALESCE(:ataque, ataque),
  elemental = COALESCE(:elemental, elemental),
  ultimate = COALESCE(:ultimate, ultimate)
WHERE ID = :id
"""

QUERY_DELETE_TALENTOS = "DELETE FROM talentos WHERE ID = :id"

engine = create_engine("mysql+mysqlconnector://root:contraseña@localhost:3306/genshin")#cambiar "contraseña" por la contraseña del root

def run_query(query, parameters=None):
  with engine.connect() as conn:
    with conn.begin():
      result = conn.execute(text(query), parameters)
    return result

def all_talentos():
  return run_query(QUERY_TODOS_LOS_TALENTOS).fetchall()

def talentos_by_id(id):
  return run_query(QUERY_TALENTOS_BY_ID, {'id': id}).fetchall()

def add_talentos(id, ataque, elemental, ultimate):
    try:
        run_query(QUERY_ADD_TALENTOS, {'id': id, 'ataque': ataque, 'elemental': elemental, 'ultimate': ultimate})
        return {"message": "Talentos creados"}
    except SQLAlchemyError as e:
        return {"error": str(e)}

def update_talentos(id, ataque=None, elemental=None, ultimate=None):
    try:
        result = run_query(QUERY_UPDATE_TALENTOS, {'id': id, 'ataque': ataque, 'elemental': elemental, 'ultimate': ultimate})
        if result.rowcount == 0:
            return {"error": "Talentos no encontrados"}
        return {"message": "Talentos actualizados"}
    except SQLAlchemyError as e:
        return {"error": str(e)}

def delete_talentos(id):
  try:
    result = run_query(QUERY_DELETE_TALENTOS,{'id':id})
    if result.rowcount == 0:
      return {"error": "Talentos no encontrados"}
    return {"message": "Talentos eliminada"}
  except SQLAlchemyError as e:
    return {"error": str(e)}
