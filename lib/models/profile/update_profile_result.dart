class UpdateProfileResult {
  Data data;
  bool status;
  String message;
  String error;

  UpdateProfileResult({this.data, this.status, this.message});

  UpdateProfileResult.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }

  UpdateProfileResult.withError(String errorValue)
      : this.data = null,
        error = errorValue;
}

class Data {
  String noRm;
  String name;
  String noKtp;
  String provinceId;
  String cityId;
  String address;
  String gender;
  String noHp;
  String bankId;
  String tanggalLahir;
  String statusUsers;
  String foto;

  Data(
      {this.noRm,
        this.name,
        this.noKtp,
        this.provinceId,
        this.cityId,
        this.address,
        this.gender,
        this.noHp,
        this.bankId,
        this.tanggalLahir,
        this.statusUsers,
        this.foto});

  Data.fromJson(Map<String, dynamic> json) {
    noRm = json['no_rm'];
    name = json['name'];
    noKtp = json['no_ktp'];
    provinceId = json['province_id'];
    cityId = json['city_id'];
    address = json['address'];
    gender = json['gender'];
    noHp = json['no_hp'];
    bankId = json['bank_id'];
    tanggalLahir = json['tanggal_lahir'];
    statusUsers = json['status_users'];
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no_rm'] = this.noRm;
    data['name'] = this.name;
    data['no_ktp'] = this.noKtp;
    data['province_id'] = this.provinceId;
    data['city_id'] = this.cityId;
    data['address'] = this.address;
    data['gender'] = this.gender;
    data['no_hp'] = this.noHp;
    data['bank_id'] = this.bankId;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['status_users'] = this.statusUsers;
    data['foto'] = this.foto;
    return data;
  }
}

