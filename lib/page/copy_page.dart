


import 'package:flutter/material.dart';
import 'package:practice_api/provider/user_provider.dart';
import 'package:provider/provider.dart';

import '../model/users_model.dart';

class ExampleThree extends StatefulWidget {
  const ExampleThree({Key? key}) : super(key: key);

  @override
  _ExampleThreeState createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Api Course'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<UsersProvider>(
              builder:(context, provider, child) => FutureBuilder(
                future:provider. getUserApi () ,
                builder: (context ,AsyncSnapshot<List<UsersModel>> snapshot){

                  if(!snapshot.hasData){
                    return const CircularProgressIndicator();
                  }else{
                    return ListView.builder(
                        itemCount: provider.userList.length,
                        itemBuilder: (context , index){
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ReusbaleRow(title: 'Name', value: snapshot.data![index].name.toString()),
                                  ReusbaleRow(title: 'username', value: snapshot.data![index].username.toString()),
                                  ReusbaleRow(title: 'email', value: snapshot.data![index].email.toString()),
                                  ReusbaleRow(title: 'Address',
                                      value: snapshot.data![index].address!.geo!.lat.toString()

                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  }

                },
              ),
            ),
          )
        ],
      ),
    );
  }

}

class ReusbaleRow extends StatelessWidget {
  String title , value ;
  ReusbaleRow({Key? key , required this.title , required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value ),

        ],
      ),
    );
  }
}
