class Reward {
  final int id;
  final List<String> rewardItemUrl;
  final double pointCharge;
  final int stock;
  final String itemName;
  final String itemDescription;
  final List<int> itemType;
  final double height;
  final double humidity;
  final String size;
  final String weight;

  Reward(
      {required this.id,
      required this.rewardItemUrl,
      required this.pointCharge,
      required this.stock,
      required this.itemName,
      required this.itemDescription,
      required this.itemType,
      required this.height,
      required this.humidity,
      required this.size,
      required this.weight});

  factory Reward.fromJson(Map<String, dynamic> json) {
    return Reward(
        id: json['id'],
        rewardItemUrl: json['rewardItemUrl'],
        pointCharge: json['pointCharge'],
        stock: json['stock'],
        itemName: json['itemName'],
        itemDescription: json['itemDescription'],
        itemType: json['itemType'],
        height: json['height'],
        humidity: json['humidity'],
        size: json['size'],
        weight: json['weight']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'rewardItemUrl': rewardItemUrl,
        'pointCharge': pointCharge,
        'stock': stock,
        'itemName': itemName,
        'itemDescription': itemDescription,
        'itemType': itemType,
        'height': height,
        'humidity': humidity,
        'size': size,
        'weight': weight
      };
}
