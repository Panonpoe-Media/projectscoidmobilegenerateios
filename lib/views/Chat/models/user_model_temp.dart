class UserModel {
  String? sId;
  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? birthDate;
  String? imageUrl;
  String? fullName;
  int? age;
  String? gender;

  UserModel(
      {this.sId,
      this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.birthDate,
      this.imageUrl,
      this.fullName,
      this.age,
      this.gender});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json != null && json['_id'] != null ? json['_id'] : null;
    id = json != null && json['id'] != null ? json['id'] : null;
    email = json != null && json['email'] != null ? json['email'] : null;
    firstName =
        json != null && json['firstName'] != null ? json['firstName'] : null;
    lastName =
        json != null && json['lastName'] != null ? json['lastName'] : null;
    birthDate =
        json != null && json['birthDate'] != null ? json['birthDate'] : null;
    imageUrl =
        json != null && json['imageUrl'] != null ? json['imageUrl'] : null;
    fullName =
        json != null && json['fullName'] != null ? json['fullName'] : null;
    age = json != null && json['age'] != null ? json['age'] : null;
    gender = json != null && json['gender'] != null ? json['gender'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id'] = this.id;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['birthDate'] = this.birthDate;
    data['imageUrl'] = this.imageUrl;
    data['fullName'] = this.fullName;
    data['age'] = this.age;
    data['gender'] = this.gender;
    return data;
  }
}
