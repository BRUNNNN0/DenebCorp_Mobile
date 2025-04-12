import 'package:flutter/material.dart';

class FundoDegradeAzulClaro extends StatelessWidget {
  const FundoDegradeAzulClaro({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 171, 223, 243), 
                  Color.fromARGB(255, 227, 231, 233),
                  Color.fromARGB(255, 250, 250, 250),
                  Color.fromARGB(255, 255, 255, 255),
                ]
              )
            ),
          );
  }
}