import 'dart:convert';

class ShoploginModel {
  bool? status;
  String? message;
  UserData? data;

  ShoploginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }
}









// class HomeModel {
//   bool? status;
//   Data? data;
//
//   HomeModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     data =  Data.fromJson(json['data']);
//   }
// }
//
// class Data {
//   List<Banners>? banners=[];
//   List<Products>? products=[];
//
//
//   Data.fromJson(Map<String, dynamic> json) {
//     json['banners'].forEach((value) {
//       banners?.add(value);
//     });
//     json['products'].forEach((value) {
//       products?.add(value);
//     });
//
//   }
// }
//
// class Banners {
//   int? id;
//   String? image;
//
//
//   Banners.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     image = json['image'];
//   }
// }
//
// class Products {
//   int? id;
//   dynamic price;
//   dynamic old_price;
//   dynamic discount;
//   String? image;
//   String? name;
//   bool? in_favorites;
//   bool? in_cart;
//
//
//   Products.fromJson(Map<String, dynamic> json) {
//
//     id = json['id'];
//     price = json['price'];
//     old_price = json['old_price'];
//     discount = json['discount'];
//     image = json['image'];
//     name = json['name'];
//     in_favorites = json['in_favorites'];
//     in_cart = json['in_cart'];
//   }
// }




// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);


//
// Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));
//
// String welcomeToJson(Welcome data) => json.encode(data.toJson());


// ****************************************************************************************


class HomeModel {
  bool? status;
  dynamic message;
  Data? data;

  HomeModel({
    this.status,
    this.message,
    this.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );


}

class Data {
  List<Banner>? banners;
  List<Product>? products;


  Data({
    this.banners,
    this.products,

  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    banners: json["banners"] == null ? [] : List<Banner>.from(json["banners"]!.map((x) => Banner.fromJson(x))),
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),

  );


}

class Banner {
  int? id;
  String? image;

  Banner({
    this.id,
    this.image,
  });
  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    id: json["id"],
    image: json["image"],

  );

}


class Product {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  String? description;
  bool? inFavorites;
  bool? inCart;

  Product({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
    this.inFavorites,
    this.inCart,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    price: json["price"]?.toDouble(),
    oldPrice: json["old_price"]?.toDouble(),
    discount: json["discount"],
    image: json["image"],
    name: json["name"],
    description: json["description"],
    inFavorites: json["in_favorites"],
    inCart: json["in_cart"],
  );

}




// ****************************************************************************************



class Catogerymodel {
  bool? status;
  dynamic message;
  Data_c? data;

  Catogerymodel({
    this.status,
    this.message,
    this.data,
  });

  factory Catogerymodel.fromJson(Map<String, dynamic> json) => Catogerymodel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data_c.fromJson(json["data"]),
  );


}

class Data_c {
  List<Datum>? data;

  Data_c({
    this.data,
  });

  factory Data_c.fromJson(Map<String, dynamic> json) => Data_c(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );


}

class Datum {
  int? id;
  String? name;
  String? image;

  Datum({
    this.id,
    this.name,
    this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );


}



//****************************************



class favmodel {
  bool? status;
  String? message;


  favmodel({
    this.status,
    this.message,

  });

  factory favmodel.fromJson(Map<String, dynamic> json) =>
      favmodel(
        status: json["status"],
        message: json["message"],
      );
}



//*****************************************



class favoomodel {
  bool? status;
  dynamic message;
  favooData? data;

  favoomodel({
    this.status,
    this.message,
    this.data,
  });

  factory favoomodel.fromJson(Map<String, dynamic> json) => favoomodel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : favooData.fromJson(json["data"]),
  );


}

class favooData {

  List<favooDatum>? data=[];


  favooData({

    this.data,

  });

  factory favooData.fromJson(Map<String, dynamic> json) => favooData(

    data: json["data"] == null ? [] : List<favooDatum>.from(json["data"]!.map((x) => favooDatum.fromJson(x))),

  );



}

class favooDatum {
  int? id;
  favooProduct? product;

  favooDatum({
    this.id,
    this.product,
  });

  factory favooDatum.fromJson(Map<String, dynamic> json) => favooDatum(
    id: json["id"],
    product: json["product"] == null ? null : favooProduct.fromJson(json["product"]),
  );

}

class favooProduct {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  String? description;

  favooProduct({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
  });

  factory favooProduct.fromJson(Map<String, dynamic> json) => favooProduct(
    id: json["id"],
    price: json["price"],
    oldPrice: json["old_price"],
    discount: json["discount"],
    image: json["image"],
    name: json["name"],
    description: json["description"],
  );


}









//**************************************************


class profilemodel {
  bool? status;
  dynamic message;
  Data_profile? data;

  profilemodel({
    this.status,
    this.message,
    this.data,
  });

  factory profilemodel.fromJson(Map<String, dynamic> json) => profilemodel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data_profile.fromJson(json["data"]),
  );


  }


class Data_profile {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  Data_profile({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.points,
    this.credit,
    this.token,
  });

  factory Data_profile.fromJson(Map<String, dynamic> json) => Data_profile(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    image: json["image"],
    points: json["points"],
    credit: json["credit"],
    token: json["token"],
  );


}



