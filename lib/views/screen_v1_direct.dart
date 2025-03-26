import 'package:flutter/material.dart';

class Screen_V1_Direct extends StatelessWidget {
  const Screen_V1_Direct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ecran V1'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //V1 : Retour vers l'écran principal sur clic bouton (L'AppBar contient également la flèche de retour arrière)
            Navigator.pop(context);
          },
          child: Text('Retour vers écran principal', style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
