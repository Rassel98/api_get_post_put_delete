// import 'package:flutter/material.dart';
// import 'package:practice_api/provider/person_provider.dart';
// import 'package:practice_api/provider/user_provider.dart';
// import 'package:provider/provider.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:
//           Consumer<PersonProvider>(
//             builder:(context, provider, child) => FutureBuilder(
//               future: provider.getDaata('/users'),
//               builder:(context, snapshot) {
//                 if(snapshot.hasData){
//                   return ListView.builder(
//                     itemCount: provider.personList.length,
//                     itemBuilder: (context, index) {
//                       return  ListTile();
//                       // final user=provider.userList[index];
//                       // return ListTile(
//                       //   title: Text('UserName: ${user.username!}'),
//                       //   subtitle:Column(
//                       //     crossAxisAlignment: CrossAxisAlignment.start,
//                       //     children: [
//                       //       Text('Street address: ${user.address!.street!}'),
//                       //       Text('Email: ${user.email!}'),
//                       //     ],
//                       //   ) ,
//                       //   trailing:Text('City: ${user.address!.city!}') ,
//                       // );
//                     },);
//                 }
//                 else{
//                   return const Center(child: Text('Loading..'));
//                 }
//
//               },
//             ),
//           )
//     );
//   }
// }
