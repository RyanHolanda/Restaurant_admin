// ignore_for_file: public_member_api_docs, sort_constructors_first
class OrderModel {
  String clientName;
  String clientPixKey;
  String clientWillPay;
  String date;
  String clientNumber;
  bool isDelivery;
  String clientAdress;
  String items;
  String meatPoint;
  String molhoOrMaionese;
  String paymentMethod;
  String wantSachets;
  int id;
  double price;
  OrderModel({
    required this.clientName,
    required this.clientPixKey,
    required this.clientNumber,
    required this.clientWillPay,
    required this.date,
    required this.isDelivery,
    required this.clientAdress,
    required this.items,
    required this.meatPoint,
    required this.molhoOrMaionese,
    required this.paymentMethod,
    required this.wantSachets,
    required this.id,
    required this.price,
  });

  factory OrderModel.fromjson(Map<String, dynamic> json) {
    return OrderModel(
        clientNumber: json['client_number'],
        clientName: json['client_name'],
        clientPixKey: json['client_pix_key'],
        clientWillPay: json['client_will_pay'],
        date: json['date'],
        isDelivery: json['is_delivery'],
        clientAdress: json['client_adress'],
        items: json['item'],
        meatPoint: json['meat_point'],
        molhoOrMaionese: json['molho_ou_maionese'],
        paymentMethod: json['payment_method'],
        wantSachets: json['sachets'],
        id: json['order_id'],
        price: json['order_total_price']);
  }
}

List<OrderModel> orderInfo = [];
