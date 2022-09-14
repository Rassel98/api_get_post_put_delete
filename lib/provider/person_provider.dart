import 'package:flutter/material.dart';
import 'package:practice_api/service/base_client_service.dart';

import '../model/person_model.dart';

class PersonProvider extends ChangeNotifier {
  var users = [];
  getData() async {
    var response = await ServiceClient.get('/users').catchError((err) {});
    if (response == null) return;
    debugPrint('successful:');

    users = userFromJson(response);

    debugPrint('Users count: ${users.length}');
  }

//post data
  Future<void> postData(User user) => ServiceClient.post('/users', user);

  Future<void> updateData(User user, String id) =>
      ServiceClient.put('/users/$id', user);

  Future<void> deleteData(String id) => ServiceClient.delete('/users/$id');

  //   final response=await ServiceClient.post('/users', user).catchError((err){});
  //   if (response == null) return;
  //   debugPrint('successful:');
  // }
  // List<PersonModel>personList=[];
  //
  // Future<List<PersonModel>> getDaata(String api)async{
  //   //final map = jsonDecode(response.body);
  //   var response= await ServiceClient.get(api);
  //   if(response!=null){
  //     final map = jsonDecode(response);
  //     personList=PersonModel.fromJson(map) as List<PersonModel>;
  //    // personList=PersonModel.fromJson(response) as List<PersonModel>;
  //     print(personList.length);
  //     return personList;
  //   }
  //   return [];
  // }

}
