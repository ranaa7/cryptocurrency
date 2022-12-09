class Searchmodel {
  final String id;
  final String name;
  final String img;
  final String symbol;
  final int? cap_rank;


  Searchmodel({required this.id, required this.name,required this.img,required this.symbol,
     required this.cap_rank});
  factory Searchmodel.fromjson(Map<String , dynamic >json){
    return Searchmodel(
      id: json["id"],
      name: json["name"],
      img: json["large"],
      symbol:  json["symbol"],
      cap_rank:  json["market_cap_rank"],
    );

  }
}