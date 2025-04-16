import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class botaoGoogle extends StatelessWidget {
  const botaoGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return                 
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.65, 
        child: ElevatedButton.icon(
          onPressed: () async {},
            icon: Image.asset(
              'assets/image/google_logo.png',
               height: 24, 
              ),
            label: Text(
              "Entrar com Google",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
        style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey), // Borda cinza
          ),
        ),
      ),
    );
  }
}