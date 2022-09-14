

import 'package:flutter/material.dart';
import 'package:practice_api/provider/person_provider.dart';
import 'package:practice_api/provider/user_provider.dart';
import 'package:provider/provider.dart';

import '../model/person_model.dart';
import '../service/base_client_service.dart';
import 'app_button.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const FlutterLogo(size: 90),
              AppButton(
                operation: 'GET',
                operationColor: Colors.lightGreen,
                description: 'Fetch users',
                onPressed: () {
                 // Provider.of<PersonProvider>(context,listen: false).getData();
                  Provider.of<UsersProvider>(context,listen: false).getUsersApiData();
                },
              ),
              AppButton(
                operation: 'POST',
                operationColor: Colors.lightBlue,
                description: 'Add user',
                onPressed: () async {
                  var user = User(
                    name: 'Russel',
                    qualifications: [
                      Qualification(degree: 'Bsc', completionData: '01-08-2022'),
                    ],
                  );
                  Provider.of<PersonProvider>(context,listen: false).postData(user).then((value) =>
                  debugPrint('Successfully'));
                },
              ),
              AppButton(
                operation: 'PUT',
                operationColor: Colors.orangeAccent,
                description: 'Edit user',
                onPressed: () async {

                  var user = User(
                    name: 'Rassel',
                    qualifications: [
                      Qualification(degree: 'Ph.D', completionData: '01-09-2026'),
                    ],
                  );
                  Provider.of<PersonProvider>(context,listen: false).updateData(user,'8').then((value) =>
                      debugPrint('Successfully updated'));

                  // var response = await ServiceClient().put('/users/$id', user).catchError((err) {});
                  // if (response == null) return;
                  // debugPrint('successful:');
                },
              ),
              AppButton(
                operation: 'DEL',
                operationColor: Colors.red,
                description: 'Delete user',
                onPressed: () async {
                  Provider.of<PersonProvider>(context,listen: false).deleteData('8').then((value) =>
                      debugPrint('Successfully delete'));
                  // var response = await ServiceClient().delete('/users/$id').catchError((err) {});
                  // if (response == null) return;
                  // debugPrint('successful:');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
