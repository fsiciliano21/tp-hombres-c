from flask import Flask, jsonify, request

import personajes

app = Flask(__name__)

"""test"""
@app.route('/api/v1/personajes', methods=['GET'])
def get_all_personajes():
  try:
    result = personaje.all_personajes()
  except Exception as e:
    return jsonify({'error': str(e)}), 500

  response = []
  for row in result:
    response.append({
      'ID': id[0],
      'nombre': row[1],
      'edad': row[2],
      'region': row[3],
      'elemento': row[4]
    })

  return jsonify(response), 200

@app.route('/api/v1/personajes/<int:id>', methods=['GET'])
def get_by_id(personaje_id):
    try:
        result = personaje.personaje_by_id(personaje_id)
    except Exception as e:
        return jsonify({'error': str(e)}), 500

    #if len(result) == 0:
    if not result:
        return jsonify({'error': 'No se encontró el personaje'}), 404

    result = result[0]
    return jsonify({
      'nombre': row[0],
      'edad': row[1],
      'region': row[2],
      'elemento': row[3]
    }), 200


if __name__ == "__main__":
    app.run("127.0.0.1", port="5001", debug=True)
