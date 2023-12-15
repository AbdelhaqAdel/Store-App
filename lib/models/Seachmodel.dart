

class searchmodel {
  bool? status;
  dynamic message;
  Data_search? data;

  searchmodel({
    this.status,
    this.message,
    this.data,
  });

  factory searchmodel.fromJson(Map<String, dynamic> json) => searchmodel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data_search.fromJson(json["data"]),
  );


}

class Data_search {
  int? currentPage;
  List<Datum_search>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Data_search({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory Data_search.fromJson(Map<String, dynamic> json) => Data_search(
    currentPage: json["current_page"],
    data: json["data"] == null ? [] : List<Datum_search>.from(json["data"]!.map((x) => Datum_search.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );


}

class Datum_search {
  int? id;
  double? price;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;

  Datum_search({
    this.id,
    this.price,
    this.image,
    this.name,
    this.description,
    this.images,
    this.inFavorites,
    this.inCart,
  });

  factory Datum_search.fromJson(Map<String, dynamic> json) => Datum_search(
    id: json["id"],
    price: json["price"]?.toDouble(),
    image: json["image"],
    name: json["name"],
    description: json["description"],
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    inFavorites: json["in_favorites"],
    inCart: json["in_cart"],
  );

}
