class Student_LoginModel {
  bool? status;
  Data? data;
  String? message;
  String? accessToken;
  String? tokenType;
  String? role;

  Student_LoginModel(
      {this.status,
        this.data,
        this.message,
        this.accessToken,
        this.tokenType,
        this.role});

  Student_LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['role'] = this.role;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? password;
  String? phoneNumber;
  String? image;
  String? instituteId;
  String? classId;
  String? createdAt;
  String? updatedAt;
  Institute? institute;

  Data(
      {this.id,
        this.name,
        this.email,
        this.password,
        this.phoneNumber,
        this.image,
        this.instituteId,
        this.classId,
        this.createdAt,
        this.updatedAt,
        this.institute});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    image = json['image'];
    instituteId = json['institute_id'];
    classId = json['class_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    institute = json['institute'] != null
        ? new Institute.fromJson(json['institute'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phoneNumber'] = this.phoneNumber;
    data['image'] = this.image;
    data['institute_id'] = this.instituteId;
    data['class_id'] = this.classId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.institute != null) {
      data['institute'] = this.institute!.toJson();
    }
    return data;
  }
}

class Institute {
  int? id;
  String? instituteCode;
  String? name;
  String? email;
  String? password;
  String? image;
  String? phoneNumber;
  String? country;
  String? address;
  String? status;
  String? createdAt;
  String? updatedAt;

  Institute(
      {this.id,
        this.instituteCode,
        this.name,
        this.email,
        this.password,
        this.image,
        this.phoneNumber,
        this.country,
        this.address,
        this.status,
        this.createdAt,
        this.updatedAt});

  Institute.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    instituteCode = json['institute_code'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    image = json['image'];
    phoneNumber = json['phoneNumber'];
    country = json['country'];
    address = json['address'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['institute_code'] = this.instituteCode;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['image'] = this.image;
    data['phoneNumber'] = this.phoneNumber;
    data['country'] = this.country;
    data['address'] = this.address;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
