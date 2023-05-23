/*
class RS_Model {
  bool? status;
  Data? data;

  RS_Model({this.status, this.data});

  RS_Model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? instituteCode;
  String? name;
  String? email;
  String? password;
  String? phoneNumber;
  String? country;
  String? address;
  String? createdAt;
  String? updatedAt;
  List<Classes>? classes;

  Data(
      {this.id,
        this.instituteCode,
        this.name,
        this.email,
        this.password,
        this.phoneNumber,
        this.country,
        this.address,
        this.createdAt,
        this.updatedAt,
        this.classes});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    instituteCode = json['institute_code'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    country = json['country'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['classes'] != null) {
      classes = <Classes>[];
      json['classes'].forEach((v) {
        classes!.add(new Classes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['institute_code'] = this.instituteCode;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phoneNumber'] = this.phoneNumber;
    data['country'] = this.country;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.classes != null) {
      data['classes'] = this.classes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Classes {
  int? id;
  String? name;
  String? instituteId;
  String? createdAt;
  String? updatedAt;
  String? teacherId;
  List<Subjects>? subjects;

  Classes(
      {this.id,
        this.name,
        this.instituteId,
        this.createdAt,
        this.updatedAt,
        this.teacherId,
        this.subjects});

  Classes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    instituteId = json['institute_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    teacherId = json['teacher_id'];
    if (json['subjects'] != null) {
      subjects = <Subjects>[];
      json['subjects'].forEach((v) {
        subjects!.add(new Subjects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['institute_id'] = this.instituteId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['teacher_id'] = this.teacherId;
    if (this.subjects != null) {
      data['subjects'] = this.subjects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subjects {
  int? id;
  String? name;
  String? classId;
  String? createdAt;
  String? updatedAt;

  Subjects({this.id, this.name, this.classId, this.createdAt, this.updatedAt});

  Subjects.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    classId = json['class_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['class_id'] = this.classId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
*/
