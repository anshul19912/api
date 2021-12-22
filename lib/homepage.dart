import 'package:api/models/users.dart';
import 'package:flutter/material.dart';
import '/services/fetchdata.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Users>>? userlist;
  @override
  void initState() {
    //use: page pehle se hi api fetch krke rakhe
    // TODO: implement initState
    super.initState();
    userlist = fetchUsers().then((value) {
      return value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: userlist,
      builder: (context, AsyncSnapshot<List<Users>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(snapshot.data![0].firstName!),
            for (Users item in snapshot.data!) Text(item.lastName!)
          ],
        );
      },
    ));
  }
}
