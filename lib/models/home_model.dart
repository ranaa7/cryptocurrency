class Homemodel {
  final String id;
  final String name;
  final String symbol;
  final String image;
  //final double current_price;
  final double price_change_24h;
  final double price_change_percentage_24h;
  final int market_cap_rank;

  Homemodel(
      {required this.id,
      required this.name,
      required this.symbol,
      required this.image,
      //required this.current_price,
      required this.price_change_24h,
      required this.price_change_percentage_24h,
      required this.market_cap_rank});

  factory Homemodel.fromJson(Map<String, dynamic> json) {
    return Homemodel(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        image: json["image"],
        //current_price: json["current_price"],
        price_change_24h: json["price_change_24h"],
        price_change_percentage_24h: json["price_change_percentage_24h"],
        market_cap_rank: json["market_cap_rank"]);
  }
}
