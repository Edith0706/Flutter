import 'package:flutter/material.dart';

class LlenadoScreen extends StatefulWidget {
  @override
  _LlenadoScreenState createState() => _LlenadoScreenState();
}

class _LlenadoScreenState extends State<LlenadoScreen> {
  String? _selectedEquipoName;
  String? _proximoMtto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleccion'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Widget para seleccionar el equipo médico
          _buildEquipoComboBox(),
          SizedBox(height: 20),
          // Texto para mostrar la fecha del próximo mantenimiento
          Text(
            _proximoMtto != null ? 'Próximo Mantenimiento: $_proximoMtto' : '',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildEquipoComboBox() {
    return DropdownButtonFormField<String>(
      value: _selectedEquipoName,
      items: [
        'Rayos X Portatil',
        'Desfribilador',
        'Monitor de Signos Vitales',
        'Ventilador Pulmonar',
        'Electrocardiograma',
        'Incubadora Neonatal',
      ].map((nombre) {
        return DropdownMenuItem<String>(
          value: nombre,
          child: Text(nombre),
        );
      }).toList(),
      hint: const Text('Selecciona un equipo médico'),
      onChanged: (value) {
        setState(() {
          _selectedEquipoName = value;
          _proximoMtto = _getProximoMtto(value);
        });
      },
    );
  }

  String? _getProximoMtto(String? equipoName) {
    switch (equipoName) {
      case 'Rayos X Portatil':
        return '15 de septiembre del 2024';
      case 'Desfribilador':
        return '10 de febrero del 2024';
      case 'Monitor de Signos Vitales':
        return '20 de octubre del 2024';
      case 'Ventilador Pulmonar':
        return '25 de febrero del 2024';
      case 'Electrocardiograma':
        return '20 de septiembre del 2024';
      case 'Incubadora Neonatal':
        return '15 de enero del 2024';
      default:
        return null;
    }
  }
}
