import 'dart:convert';
import 'package:api/models/users.dart';
import 'package:http/http.dart' as http;

Future<List<Users>> fetchUsers() async {
  http.Response response = await http.get(Uri.parse(
      'https://reqres.in/api/users?page=2')); // we are storing json data in response
  // print(response.body);

  Map<String, dynamic> map =
      jsonDecode(response.body); // we are converting json data into map
  // print(map['data'][0]['email']);

  List<Users> userlist = []; // we are creating list of users

  // we are storing each user in item (as Map) from 'data'
  for (Map<String, dynamic> item in map['data']) {
    // we created User object and we are storing each user from item (as object) in user object
    Users user = Users.fromMap(item);
    userlist.add(user); // Now we are adding each user in userlist
  }

  for (Users item in userlist) {
    print(item.email);
    print(item.firstName);
  }
  return userlist; // we are returning userlist

  // Users user=  Users.fromMap(map['data'][0]);
  // print(user.firstName);
}
