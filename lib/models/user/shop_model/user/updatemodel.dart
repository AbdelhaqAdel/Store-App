

class updatemodel {
  bool? status;
  String? message;
  Data_update? data;

  updatemodel({
    this.status,
    this.message,
    this.data,
  });

  factory updatemodel.fromJson(Map<String, dynamic> json) => updatemodel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data_update.fromJson(json["data"]),
  );


}

class Data_update {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  Data_update({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.points,
    this.credit,
    this.token,
  });

  factory Data_update.fromJson(Map<String, dynamic> json) => Data_update(
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
