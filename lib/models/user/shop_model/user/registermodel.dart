
class registermodel {
  bool? status;
  String? message;
  Data? data;

  registermodel({
    this.status,
    this.message,
    this.data,
  });

  factory registermodel.fromJson(Map<String, dynamic> json) => registermodel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

}

class Data {
  String? name;
  String? email;
  String? phone;
  int? id;
  String? image;
  String? token;

  Data({
    this.name,
    this.email,
    this.phone,
    this.id,
    this.image,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    id: json["id"],
    image: json["image"],
    token: json["token"],
  );


}
