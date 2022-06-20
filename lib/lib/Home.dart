// import 'package:flutter/material.dart';
// import 'package:flutter_firebase_auth/lib/1.dart';
// import 'package:flutter_firebase_auth/lib/2.dart';
// import '3.dart';

// class HomeScr extends StatelessWidget {
//   const HomeScr({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Dog Category')),
//       body:Container(
//         width: double.infinity,
//         height: double.infinity,
//         color: Colors.white,
//         child: Column(
//           children: [
//             Card(
//               child: ListTile(
//                 leading: Image.asset('images/dog.jpg',),
//                 title: const Text('Toy Poodie'),
//                 trailing: const Icon(Icons.arrow_forward),
//                  onTap: (){       
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => const Page1(),));
//                 }
//                     ),
//             ),
//         Card(
//           child: ListTile(
//                 leading: Image.asset('images/dog.jpg',),
//                 title: const Text('Toy Poodie'),
//                 trailing: const Icon(Icons.arrow_forward),
//                  onTap: (){       
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => const Page2(),));
//                 }
//           ),
//         ),
//         Card(
//           child: ListTile(
//                 leading: Image.asset('images/dog.jpg',),
//                 title: const Text('Toy Poodie'),
//                 trailing: const Icon(Icons.arrow_forward),
//                 onTap: (){       
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => const Page3(),));
//                 }
//           ),
//         ),
//         ],
//         ),
//       )
//     );
//   }
// }