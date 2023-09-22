class product {
  String? pid;
  String? pname;
  String? qty;
  String? price;
  String? addedDatetime;

  product({this.pid, this.pname, this.qty, this.price, this.addedDatetime});

  product.fromJson(Map<String, dynamic> json) {
    pid = json['pid'];
    pname = json['pname'];
    qty = json['qty'];
    price = json['price'];
    addedDatetime = json['added_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pid'] = this.pid;
    data['pname'] = this.pname;
    data['qty'] = this.qty;
    data['price'] = this.price;
    data['added_datetime'] = this.addedDatetime;
    return data;
  }
}