import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: false,
      child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color.fromRGBO(203, 100, 100, 0.8),
          child: Center(
            child: Text(
              'Carregando...',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}
