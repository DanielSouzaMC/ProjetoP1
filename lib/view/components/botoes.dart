import 'package:flutter/material.dart';

criabotao(label) {
  return SizedBox(
    width: 500,
    child: Align(
      alignment: Alignment.center,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 22),
            minimumSize: const Size(200, 50),
          ),
          onPressed: () {},
          child: Text(label)),
    ),
  );
}

criabotaoEmail(label,) {
  return SizedBox(
    width: 500,
    child: Align(
      alignment: Alignment.center,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 22),
            minimumSize: const Size(200, 50),
          ),
          onPressed: () {},
          child: Text(label)),
    ),
  );
}
