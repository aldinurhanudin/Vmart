class StocksModel {
  int? id;
  int? quantity;

  StocksModel({
    this.id,
    this.quantity,
  });

  StocksModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = int.parse(json['quantity'].toString());
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
    };
  }

  map(Function(dynamic stock) param0) {}
}
