import 'package:flutter/material.dart';

criarCampoTexto(rotulo, controlador,{bool obscureText = false}) {
    return TextFormField(
      controller: controlador,
      obscureText: obscureText,
      style: const TextStyle(fontSize: 24),
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Colors.blueGrey),
        labelText: rotulo,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.blueGrey),
        ),
      ),
      validator: (value) {
        if (value == null) {
          return 'Informe um e-mail válido';
        } else if (value.isEmpty) {
          return 'Informe um e-mail válido';
        } 
        return null;
      },
    );
  }