from flask import Flask, jsonify, request

import personajes, armas, stats, talentos

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
      'id': row[0],
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
      'id': row[0],
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

@app.route('/api/stats', methods=['GET'])
def get_all_stats():
  try:
    result = stats.all_stats()
  except Exception as e:
    return jsonify({'error': str(e)}), 500

  response = []
  for row in result:
    response.append({
      'id': row[0],
      'vida': row[1],
      'ataque': row[2],
      'defensa': row[3],
      'maestria': row[4],
      'recarga_energia': row[5],
      'probabilidad_critico': row[6],
      'danio_critico': row[7]
    })

  return jsonify(response), 200

@app.route('/api/stats/<int:id>', methods=['GET'])
def get_by_stats_id(id):
    try:
        result = stats.stats_by_id(id)
    except Exception as e:
        return jsonify({'error': str(e)}), 500

    if not result:
        return jsonify({'error': 'No se encontraron las stats'}), 404

    row = result[0]
    return jsonify({
      'vida': row[0],
      'ataque': row[1],
      'defensa': row[2],
      'maestria': row[3],
      'recarga_energia': row[4],
      'probabilidad_critico': row[5],
      'danio_critico': row[6]
    }), 200

@app.route('/api/stats', methods=['POST'])
def create_stats():
  data = request.json
  try:
    response = stats.add_stats(
       data['id'], data['vida'], data['ataque'], data['defensa'], data['maestria'], data['recarga_energia'], data['probabilidad_critico'], data['danio_critico']
    )
    return jsonify(response), 201
  except Exception as e:
     return jsonify({'error': str(e)}), 500

@app.route('/api/stats/<int:id>', methods=['PUT'])
def update_stats(id):
   data = request.json
   try:
      response = stats.update_stats(
         id,
         vida = data.get('vida'),
         ataque = data.get('ataque'),
         defensa = data.get('defensa'),
         maestria = data.get('maestria'),
         recarga_energia = data.get('recarga_energia'),
         probabilidad_critico = data.get('probabilidad_critico'),
         danio_critico = data.get('danio_critico')
      )
      return jsonify(response), 200
   except Exception as e:
      return jsonify({'error': str(e)}), 500
   
@app.route('/api/stats/<int:id>', methods=['DELETE'])
def delete_stats(id):
   try:
      response = stats.delete_stats(id)
      return jsonify(response), 200
   except Exception as e:
      return jsonify({'error': str(e)}), 500

####################################################################################

@app.route('/api/talentos', methods=['GET'])
def get_all_talentos():
  try:
    result = talentos.all_talentos()
  except Exception as e:
    return jsonify({'error': str(e)}), 500

  response = []
  for row in result:
    response.append({
      'id': row[0],
      'ataque': row[1],
      'elemental': row[2],
      'ultimate': row[3]
    })

  return jsonify(response), 200

@app.route('/api/talentos/<int:id>', methods=['GET'])
def get_by_talentos_id(id):
    try:
        result = talentos.talentos_by_id(id)
    except Exception as e:
        return jsonify({'error': str(e)}), 500

    if not result:
        return jsonify({'error': 'No se encontraron los talentos'}), 404

    row = result[0]
    return jsonify({
      'ataque': row[0],
      'elemental': row[1],
      'ultimate': row[2]
    }), 200

@app.route('/api/talentos', methods=['POST'])
def create_talentos():
  data = request.json
  try:
    response = talentos.add_talentos(
       data['id'], data['ataque'], data['elemental'], data['ultimate']
    )
    return jsonify(response), 201
  except Exception as e:
     return jsonify({'error': str(e)}), 500

@app.route('/api/talentos/<int:id>', methods=['PUT'])
def update_talentos(id):
   data = request.json
   try:
      response = talentos.update_talentos(
         id,
         ataque = data.get('ataque'),
         elemental = data.get('elemental'),
         ultimate = data.get('ultimate')
      )
      return jsonify(response), 200
   except Exception as e:
      return jsonify({'error': str(e)}), 500
   
@app.route('/api/talentos/<int:id>', methods=['DELETE'])
def delete_talentos(id):
   try:
      response = talentos.delete_talentos(id)
      return jsonify(response), 200
   except Exception as e:
      return jsonify({'error': str(e)}), 500

####################################################################################

if __name__ == "__main__":
    app.run("127.0.0.1", port="5001", debug=True)