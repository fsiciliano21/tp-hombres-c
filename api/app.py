from flask import Flask, jsonify, request

import personajes, armas

app = Flask(__name__)

@app.route('/api/personajes', methods=['GET'])
def get_all_personajes():
  try:
    result = personajes.all_personajes()
  except Exception as e:
    return jsonify({'error': str(e)}), 500

  response = []
  for row in result:
    response.append({
      'ID': row[0],
      'nombre': row[1],
      'edad': row[2],
      'region': row[3],
      'elemento': row[4]
    })

  return jsonify(response), 200

@app.route('/api/personajes/<int:id>', methods=['GET'])
def get_by_id(id):
    try:
        result = personajes.personaje_by_id(id)
    except Exception as e:
        return jsonify({'error': str(e)}), 500

    if not result:
        return jsonify({'error': 'No se encontró el personaje'}), 404

    row = result[0]
    return jsonify({
      'nombre': row[0],
      'edad': row[1],
      'region': row[2],
      'elemento': row[3]
    }), 200

@app.route('/api/personajes', methods=['POST'])
def create_personajes():
  data = request.json
  try:
    response = personajes.add_personaje(
       data['nombre'], data['edad'], data['region'], data['elemento']
    )
    return jsonify(response), 201
  except Exception as e:
     return jsonify({'error': str(e)}), 500

@app.route('/api/personajes/<int:id>', methods=['PUT'])
def update_personaje(id):
   data = request.json
   try:
      response = personajes.update_personaje(
         id,
         nombre = data.get('nombre'),
         edad = data.get('edad'),
         region = data.get('region'),
         elemento = data.get('elemento')
      )
      return jsonify(response), 200
   except Exception as e:
      return jsonify({'error': str(e)}), 500
   
@app.route('/api/personajes/<int:id>', methods=['DELETE'])
def delete_personaje(id):
   try:
      response = personajes.delete_personaje(id)
      return jsonify(response), 200
   except Exception as e:
      return jsonify({'error': str(e)}), 500

####################################################################################3

@app.route('/api/armas', methods=['GET'])
def get_all_armas():
  try:
    result = armas.all_armas()
  except Exception as e:
    return jsonify({'error': str(e)}), 500

  response = []
  for row in result:
    response.append({
      'ID': row[0],
      'nivel': row[1],
      'refinamiento': row[2]
    })

  return jsonify(response), 200

@app.route('/api/armas/<int:id>', methods=['GET'])
def get_by_armas_id(id):
    try:
        result = armas.arma_by_id(id)
    except Exception as e:
        return jsonify({'error': str(e)}), 500

    if not result:
        return jsonify({'error': 'No se encontró el arma'}), 404

    row = result[0]
    return jsonify({
      'nivel': row[0],
      'refinamiento': row[1]
    }), 200

@app.route('/api/armas', methods=['POST'])
def create_armas():
  data = request.json
  try:
    response = armas.add_arma(
       data['id'], data['nivel'], data['refinamiento']
    )
    return jsonify(response), 201
  except Exception as e:
     return jsonify({'error': str(e)}), 500

@app.route('/api/armas/<int:id>', methods=['PUT'])
def update_arma(id):
   data = request.json
   try:
      response = armas.update_arma(
         id,
         nivel = data.get('nivel'),
         refinamiento = data.get('refinamiento')
      )
      return jsonify(response), 200
   except Exception as e:
      return jsonify({'error': str(e)}), 500
   
@app.route('/api/armas/<int:id>', methods=['DELETE'])
def delete_arma(id):
   try:
      response = armas.delete_arma(id)
      return jsonify(response), 200
   except Exception as e:
      return jsonify({'error': str(e)}), 500

####################################################################################
   
if __name__ == "__main__":
    app.run("127.0.0.1", port="5001", debug=True)
