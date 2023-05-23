class InstituteRegisterModel {
  String? _name;
  String? _email;
  String? _password;
  String? _contact;
  String? _address;
  String? _country;
  int? _id;

  InstituteRegisterModel(
      {String? name,
      String? email,
      String? password,
      String? contact,
      String? address,
      String? country,
      int? id}) {
    if (name != null) {
      this._name = name;
    }
    if (email != null) {
      this._email = email;
    }
    if (password != null) {
      this._password = password;
    }
    if (contact != null) {
      this._contact = contact;
    }
    if (address != null) {
      this._address = address;
    }
    if (country != null) {
      this._country = country;
    }
    if (id != null) {
      this._id = id;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get password => _password;
  set password(String? password) => _password = password;
  String? get contact => _contact;
  set contact(String? contact) => _contact = contact;
  String? get address => _address;
  set address(String? address) => _address = address;
  String? get country => _country;
  set country(String? country) => _country = country;
  int? get id => _id;
  set id(int? id) => _id = id;

  InstituteRegisterModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
    _contact = json['contact'];
    _address = json['address'];
    _country = json['country'];
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['email'] = this._email;
    data['password'] = this._password;
    data['contact'] = this._contact;
    data['address'] = this._address;
    data['country'] = this._country;
    data['id'] = this._id;
    return data;
  }
}
