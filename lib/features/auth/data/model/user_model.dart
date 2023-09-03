class UserModel {
  String userName;
  String userId;
  String userPassword;
  String? userEmail;
  List? favPlants;
  String userPoints;
  String userLocation;

  UserModel(
      {required this.userName,
      required this.userId,
      required this.userPassword,
      required this.userEmail,
      this.favPlants = const [],
      required this.userPoints,
       this.userLocation = "32.8734, 13.1794"});

  //from map
  factory UserModel.fromMap(Map<dynamic, dynamic> map) {
    return UserModel(
        userName: map["userName"] ?? "",
        userLocation: map["userLocation"] ?? "",
        userId: map["userId"] ?? "",
        userPassword: map["userPassword"] ?? "",
        userEmail: map["userEmail"] ?? "",
        userPoints: map["userPoints"] ?? "",
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
      "favPlants": favPlants,
      "userPoints": userPoints,
      "userLocation" : userLocation
    };
  }
}
