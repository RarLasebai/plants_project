class PlantModel {
  String plantName;
  String plantId;
  String plantImage;
  String plantDesc;
  String plantCateg;
  int plantPrice;

  PlantModel(
      {required this.plantName,
      required this.plantId,
      required this.plantImage,
      required this.plantDesc,
      required this.plantPrice,
      required this.plantCateg});

  //from map
  factory PlantModel.fromMap(Map<String, dynamic> map) {
    return PlantModel(
      plantName: map["plantName"] ?? "",
      plantId: map["plantId"] ?? "",
      plantImage: map["plantImage"] ?? "",
      plantDesc: map["plantDesc"] ?? "",
      plantPrice: map["plantPrice"] ?? "",
      plantCateg: map["plantCateg"] ?? "",
    );
  }

  //to map
  Map<String, dynamic> toMap() {
    return {
      "plantName": plantName,
      "plantId": plantId,
      "plantDesc": plantDesc,
      "plantImage": plantImage,
      "plantPrice": plantPrice,
      "plantCateg": plantCateg
    };
  }
}
