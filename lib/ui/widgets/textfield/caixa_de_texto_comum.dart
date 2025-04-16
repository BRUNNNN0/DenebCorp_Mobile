import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class caixadetexto extends StatelessWidget {
    final String label;

    const caixadetexto({
      Key? key,
      required this.label,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return SizedBox(
        width: MediaQuery.of(context).size.width * 0.96,
        child: TextField(
          decoration: InputDecoration(
            labelText: label,
            
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      );
    }
  }