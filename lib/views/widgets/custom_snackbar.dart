import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

void CustomSnackBar(BuildContext context, String texto, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: Duration(seconds: 1),
    backgroundColor: color,
    content: AutoSizeText(
      texto,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
      maxLines: 1,
    ),
  ));
}
