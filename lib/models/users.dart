class Users {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avtar;

  Users({this.id,this.email,this.firstName,this.lastName,this.avtar});

  factory Users.fromMap(Map<String,dynamic> map) {                              
    return Users(
      id: map['id'],
      email: map['email'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      avtar: map['avatar']
    );
  }
}