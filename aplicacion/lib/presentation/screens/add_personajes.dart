import 'package:flutter/material.dart';

class AddPersonajes extends StatefulWidget {
  const AddPersonajes({super.key});

  @override
  _AddPersonajesState createState() => _AddPersonajesState();
}

class _AddPersonajesState extends State<AddPersonajes> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _edadController = TextEditingController();
  String _nacion = 'Mondstadt';
  String _elemento = 'Ameno';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Personaje'),
        backgroundColor: const Color(0xFFEDD9B7),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(labelText: 'Nombre'),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _edadController,
                decoration: const InputDecoration(labelText: 'Edad'),
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese una edad';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _nacion,
                decoration: const InputDecoration(labelText: 'Nación'),
                items: ['Mondstadt', 'Liyue', 'Inazuma', 'Sumeru', 'Fontaine', 'Natlan']
                    .map((nacion) => DropdownMenuItem(
                          value: nacion,
                          child: Text(nacion, style: const TextStyle(color: Colors.white)),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _nacion = value!;
                  });
                },
                style: const TextStyle(color: Colors.white),
              ),
              DropdownButtonFormField<String>(
                value: _elemento,
                decoration: const InputDecoration(labelText: 'Elemento'),
                items: ['Ameno', 'Cryo', 'Pyro', 'Electro', 'Dendro', 'Hydro']
                    .map((elemento) => DropdownMenuItem(
                          value: elemento,
                          child: Text(elemento, style: const TextStyle(color: Colors.white)),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _elemento = value!;
                  });
                },
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final nuevoPersonaje = {
                      'nombre': _nombreController.text,
                      'edad': _edadController.text,
                      'nacion': _nacion,
                      'elemento': _elemento,
                    };
                    Navigator.pop(context, nuevoPersonaje);
                  }
                },
                child: const Text('Agregar Personaje'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _edadController.dispose();
    super.dispose();
  }
}