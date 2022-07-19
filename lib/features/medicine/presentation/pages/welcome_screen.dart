// import 'package:flutter/material.dart';

// import './user_medicamento_screen.dart';

// class WelcomeScreen extends StatelessWidget {
//   static const routeName = '/welcome';

//   const WelcomeScreen({Key? key}) : super(key: key);

  

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Stack(
//         children: <Widget>[
//           Container(
//             decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                     begin: Alignment.topRight,
//                     end: Alignment.bottomLeft,
//                     stops: [
//                   0.1,
//                   0.4,
//                   0.6,
//                   0.9
//                 ],
//                     colors: [
//                   Colors.white,
//                   Colors.white,
//                   Colors.white,
//                   Color.fromARGB(255, 244, 243, 243)
//                 ])),
//           ),
//           Container(
//             alignment: Alignment.center,
//             margin: const EdgeInsets.symmetric(horizontal: 20),
//             child: Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15.0),
//               ),
//               color: Colors.blueGrey[400],
//               elevation: 25,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   Container(
//                     margin: const EdgeInsets.only(top: 50, bottom: 20),
//                     child: CircleAvatar(
//                       backgroundColor: Colors.white,
//                       radius: 80,
//                       child: Image.asset(
//                         'assets/images/pills.png',
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 20),
//                     child: const ListTile(
//                       title: Text('Bem-Vindo',
//                           style: TextStyle(color: Colors.white, fontSize: 40)),
//                       subtitle: Text('Agenda de Medicamentos',
//                           style: TextStyle(color: Colors.white)),
//                     ),
//                   ),
//                   const Divider(),
//                   Container(
//                     margin: const EdgeInsets.symmetric(vertical: 30),
//                     width: 200,
//                     child: ElevatedButton.icon(
//                       style: ElevatedButton.styleFrom(shape:  RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(18.0),
//                       ),
//                       elevation: 5,
//                       primary: Colors.white),
//                       onPressed: () {
//                         Navigator.of(context)
//                             .pushReplacementNamed(UserMedicamentosScreen.routeName);
//                       },
//                       icon: const Icon(Icons.flare),
//                       label: const Text(
//                         'Entrar',
//                         style: TextStyle(fontSize: 20),
//                       ),
                      
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
