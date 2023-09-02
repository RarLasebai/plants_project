class UserModel {
  String userName;
  String userId;
  String userPassword;
  String? userEmail;
  List? favPlants;

  UserModel({
    required this.userName,
    required this.userId,
    required this.userPassword,
    required this.userEmail,
    this.favPlants = const [],
  });

  //from map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        userName: map["userName"] ?? "",
        userId: map["userId"] ?? "",
        userPassword: map["userPassword"] ?? "",
        userEmail: map["userEmail"] ?? "",
        favPlants:
            map['favPlants'] == null ? null : List.from(map['favPlants']));
  }

  //to map
  Map<String, dynamic> toMap() {
    return {
      "userName": userName,
      "userId": userId,
      "userEmail": userEmail,
      "userPassword": userPassword,
      "favPlants": favPlants
    };
  }
}
