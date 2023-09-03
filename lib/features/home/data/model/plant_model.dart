class PlantModel {
  String plantName;
  String plantId;
  String plantImage;
  String plantDesc;
  String plantCateg;
  String isFav;
  String plantLocation;
  int distance;
  int plantPrice;

  int points;

  PlantModel(
      {required this.plantName,
      required this.plantId,
      required this.plantImage,
      required this.plantDesc,
      required this.plantPrice,
      required this.plantCateg,
      required this.isFav,
      required this.plantLocation,
      required this.points,
      required this.distance});

  //from map
  factory PlantModel.fromMap(Map<String, dynamic> map) {
    return PlantModel(
      distance: map['distance' ] ?? "",
      plantName: map["plantName"] ?? "",
      plantLocation: map["plantLocation"] ?? "",
      plantId: map["plantId"] ?? "",
      plantImage: map["plantImage"] ?? "",
      plantDesc: map["plantDesc"] ?? "",
      plantPrice: map["plantPrice"] ?? "",
      plantCateg: map["plantCateg"] ?? "",
      isFav: map["isFav"] ?? "",
      points: map["points"] ?? "",
    );
  }

  //to map
  Map<String, dynamic> toMap() {
    return {
      "distance" : distance,
      "plantName": plantName,
      "plantId": plantId,
      "plantDesc": plantDesc,
      "plantImage": plantImage,
      "plantPrice": plantPrice,
      "plantCateg": plantCateg,
      "isFav": isFav,
      "points": points,
      "plantLocation": plantLocation
    };
  }
}
