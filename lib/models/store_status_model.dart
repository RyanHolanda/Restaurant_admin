// ignore_for_file: public_member_api_docs, sort_constructors_first
class StoreStatusModel {
  final String id;
  final String storestatus;

  StoreStatusModel({
     required this.id,
     required this.storestatus,
  });
  factory StoreStatusModel.fromJson(Map<String, dynamic> json) {
    return StoreStatusModel(
      id: json['id'],
      storestatus: json['storestatus'],
    );
  }
}

List<StoreStatusModel> storeStatus = [];
