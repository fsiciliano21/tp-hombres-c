import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddPersonajes extends StatefulWidget {
  final Map<String, String>? personaje;

  const AddPersonajes({super.key, this.personaje});

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
  void initState() {
    super.initState();
    if (widget.personaje != null) {
      _nombreController.text = widget.personaje!['nombre']!;
      _edadController.text = widget.personaje!['edad']!;
      _nacion = widget.personaje!['nacion']!;
      _elemento = widget.personaje!['elemento']!;
    }
  }

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
              
              // nombre
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un nombre';
                  }
                  return null;
                },
              ),

              // edad
              TextFormField(
                controller: _edadController,
                decoration: const InputDecoration(
                  labelText: 'Edad',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese una edad';
                  }
                  return null;
                },
              ),
              // nacion
              DropdownButtonFormField<String>(
                value: _nacion,
                decoration: const InputDecoration(
                  labelText: 'Nación',
                  labelStyle: TextStyle(color: Colors.white),
                ),
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
                dropdownColor: Colors.black,
              ),

              // elemento
              DropdownButtonFormField<String>(
                value: _elemento,
                decoration: const InputDecoration(
                  labelText: 'Elemento',
                  labelStyle: TextStyle(color: Colors.white),
                ),
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
                dropdownColor: Colors.black,
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