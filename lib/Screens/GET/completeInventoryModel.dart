/*
class CompleteInventroyModel {
  bool? success;
  List<Data>? data;

  CompleteInventroyModel({this.success, this.data});

  CompleteInventroyModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? property;
  String? itemStatus;
  String? areaId;
  String? areaPhaseId;
  String? streetNumber;
  String? houseNumber;
  String? plotNumber;
  String? sector;
  String? size;
  String? sizeUnit;
  String? price;
  String? orientation;
  String? category;
  String? extraLand;
  String? itemCondition;
  String? agencyName;
  String? referenceName;
  String? referenceMobile;
  String? plotType;
  String? purchaseStatus;
  String? userId;
  String? flatNo;
  String? floorNo;
  String? blockNo;
  String? buildingName;
  String? bedroom;
  String? createdAt;
  String? updatedAt;
  Area? area;
  User? user;
  Phases? phase;

  Data(
      {this.id,
        this.property,
        this.itemStatus,
        this.areaId,
        this.areaPhaseId,
        this.streetNumber,
        this.houseNumber,
        this.plotNumber,
        this.sector,
        this.size,
        this.sizeUnit,
        this.price,
        this.orientation,
        this.category,
        this.extraLand,
        this.itemCondition,
        this.agencyName,
        this.referenceName,
        this.referenceMobile,
        this.plotType,
        this.purchaseStatus,
        this.userId,
        this.flatNo,
        this.floorNo,
        this.blockNo,
        this.buildingName,
        this.bedroom,
        this.createdAt,
        this.updatedAt,
        this.area,
        this.user,
        this.phase});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    property = json['property'];
    itemStatus = json['item_status'];
    areaId = json['area_id'];
    areaPhaseId = json['area_phase_id'];
    streetNumber = json['street_number'];
    houseNumber = json['house_number'];
    plotNumber = json['plot_number'];
    sector = json['sector'];
    size = json['size'];
    sizeUnit = json['size_unit'];
    price = json['price'];
    orientation = json['orientation'];
    category = json['category'];
    extraLand = json['extra_land'];
    itemCondition = json['item_condition'];
    agencyName = json['agency_name'];
    referenceName = json['reference_name'];
    referenceMobile = json['reference_mobile'];
    plotType = json['plot_type'];
    purchaseStatus = json['purchase_status'];
    userId = json['user_id'];
    flatNo = json['flat_no'];
    floorNo = json['floor_no'];
    blockNo = json['block_no'];
    buildingName = json['building_name'];
    bedroom = json['bedroom'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    area = json['area'] != null ? new Area.fromJson(json['area']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    phase = json['phase'] != null ? new Phases.fromJson(json['phase']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['property'] = this.property;
    data['item_status'] = this.itemStatus;
    data['area_id'] = this.areaId;
    data['area_phase_id'] = this.areaPhaseId;
    data['street_number'] = this.streetNumber;
    data['house_number'] = this.houseNumber;
    data['plot_number'] = this.plotNumber;
    data['sector'] = this.sector;
    data['size'] = this.size;
    data['size_unit'] = this.sizeUnit;
    data['price'] = this.price;
    data['orientation'] = this.orientation;
    data['category'] = this.category;
    data['extra_land'] = this.extraLand;
    data['item_condition'] = this.itemCondition;
    data['agency_name'] = this.agencyName;
    data['reference_name'] = this.referenceName;
    data['reference_mobile'] = this.referenceMobile;
    data['plot_type'] = this.plotType;
    data['purchase_status'] = this.purchaseStatus;
    data['user_id'] = this.userId;
    data['flat_no'] = this.flatNo;
    data['floor_no'] = this.floorNo;
    data['block_no'] = this.blockNo;
    data['building_name'] = this.buildingName;
    data['bedroom'] = this.bedroom;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.area != null) {
      data['area'] = this.area!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.phase != null) {
      data['phase'] = this.phase!.toJson();
    }
    return data;
  }
}

class Area {
  int? id;
  String? name;
  Null? createdAt;
  Null? updatedAt;
  List<Phases>? phases;

  Area({this.id, this.name, this.createdAt, this.updatedAt, this.phases});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['phases'] != null) {
      phases = <Phases>[];
      json['phases'].forEach((v) {
        phases!.add(new Phases.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.phases != null) {
      data['phases'] = this.phases!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Phases {
  int? id;
  String? title;
  String? areaId;
  String? createdAt;
  String? updatedAt;

  Phases({this.id, this.title, this.areaId, this.createdAt, this.updatedAt});

  Phases.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    areaId = json['area_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['area_id'] = this.areaId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? phone;
  String? file;
  String? email;
  Null? emailVerifiedAt;
  String? parentId;
  String? type;
  String? isActive;
  String? designation;
  String? image;
  String? address;
  String? agencyname;
  String? createdAt;
  String? updatedAt;
  Extras? extras;
  String? imageUrl;

  User(
      {this.id,
        this.name,
        this.phone,
        this.file,
        this.email,
        this.emailVerifiedAt,
        this.parentId,
        this.type,
        this.isActive,
        this.designation,
        this.image,
        this.address,
        this.agencyname,
        this.createdAt,
        this.updatedAt,
        this.extras,
        this.imageUrl});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    file = json['file'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    parentId = json['parent_id'];
    type = json['type'];
    isActive = json['is_active'];
    designation = json['designation'];
    image = json['image'];
    address = json['address'];
    agencyname = json['agencyname'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    extras =
    json['extras'] != null ? new Extras.fromJson(json['extras']) : null;
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['file'] = this.file;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['parent_id'] = this.parentId;
    data['type'] = this.type;
    data['is_active'] = this.isActive;
    data['designation'] = this.designation;
    data['image'] = this.image;
    data['address'] = this.address;
    data['agencyname'] = this.agencyname;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.extras != null) {
      data['extras'] = this.extras!.toJson();
    }
    data['image_url'] = this.imageUrl;
    return data;
  }
}

class Extras {
  int? total;
  int? pending;
  int? sold;

  Extras({this.total, this.pending, this.sold});

  Extras.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    pending = json['pending'];
    sold = json['sold'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['pending'] = this.pending;
    data['sold'] = this.sold;
    return data;
  }
}
*/
