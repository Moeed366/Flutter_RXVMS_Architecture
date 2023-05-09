//
// class Complete_Inventory_Model {
//   int? id;
//   String? propertyType;
//   String? phase;
//   String? status;
//   String? price;
//   String? size;
//   String? streetNumber;
//   String? sector;
//   String? orientation;
//   String? extras;
//   String? itemCondition;
//   String? agencyName;
//   String? name;
//   String? parentId;
//   String? createdAt;
//   String? updatedAt;
//
//   Complete_Inventory_Model(
//       {this.id,
//         this.propertyType,
//         this.phase,
//         this.status,
//         this.price,
//         this.size,
//         this.streetNumber,
//         this.sector,
//         this.orientation,
//         this.extras,
//         this.itemCondition,
//         this.agencyName,
//         this.name,
//         this.parentId,
//         this.createdAt,
//         this.updatedAt});
//
//   Complete_Inventory_Model.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     propertyType = json['property_type'];
//     phase = json['phase'];
//     status = json['status'];
//     price = json['price'];
//     size = json['size'];
//     streetNumber = json['street_number'];
//     sector = json['sector'];
//     orientation = json['orientation'];
//     extras = json['extras'];
//     itemCondition = json['item_condition'];
//     agencyName = json['agency_name'];
//     name = json['name'];
//     parentId = json['parent_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['property_type'] = this.propertyType;
//     data['phase'] = this.phase;
//     data['status'] = this.status;
//     data['price'] = this.price;
//     data['size'] = this.size;
//     data['street_number'] = this.streetNumber;
//     data['sector'] = this.sector;
//     data['orientation'] = this.orientation;
//     data['extras'] = this.extras;
//     data['item_condition'] = this.itemCondition;
//     data['agency_name'] = this.agencyName;
//     data['name'] = this.name;
//     data['parent_id'] = this.parentId;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }