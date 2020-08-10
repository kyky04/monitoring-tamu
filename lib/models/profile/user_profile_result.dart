class UserProfileResult {
  String id;
  String name;
  String identityNumber;
  String familyIdentityNumber;
  bool actived;
  String email;
  String createdAt;
  String error;
  int code;
  Village village;
  Profile profile;

  UserProfileResult(
      {this.id,
        this.name,
        this.identityNumber,
        this.familyIdentityNumber,
        this.actived,
        this.email,
        this.createdAt,
        this.village,
        this.profile});

  UserProfileResult.fromJson(int statusCode,Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    identityNumber = json['identity_number'];
    familyIdentityNumber = json['family_identity_number'];
    actived = json['actived'];
    email = json['email'];
    createdAt = json['created_at'];
    village =
    json['village'] != null ? new Village.fromJson(json['village']) : null;
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    code = statusCode;
  }

  UserProfileResult.withError(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['identity_number'] = this.identityNumber;
    data['family_identity_number'] = this.familyIdentityNumber;
    data['actived'] = this.actived;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    if (this.village != null) {
      data['village'] = this.village.toJson();
    }
    if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
    return data;
  }
}

class Village {
  String id;
  String villageId;
  String address;
  String phoneNumber;
  String email;
  bool actived;

  Village(
      {this.id,
        this.villageId,
        this.address,
        this.phoneNumber,
        this.email,
        this.actived});

  Village.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    villageId = json['village_id'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    actived = json['actived'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['village_id'] = this.villageId;
    data['address'] = this.address;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['actived'] = this.actived;
    return data;
  }
}

class Profile {
  String id;
  String userId;
  String name;
  String gender;
  String birthday;
  String birthplace;
  String region;
  String status;
  String familyRelationship;
  String education;
  String daddyName;
  String mommyName;
  String address;
  String note;
  String avatar;
  String phoneNumber;
  String createdAt;

  Profile(
      {this.id,
        this.userId,
        this.name,
        this.gender,
        this.birthday,
        this.birthplace,
        this.region,
        this.status,
        this.familyRelationship,
        this.education,
        this.daddyName,
        this.mommyName,
        this.address,
        this.note,
        this.avatar,
        this.phoneNumber,
        this.createdAt});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    gender = json['gender'];
    birthday = json['birthday'];
    birthplace = json['birthplace'];
    region = json['region'];
    status = json['status'];
    familyRelationship = json['family_relationship'];
    education = json['education'];
    daddyName = json['daddy_name'];
    mommyName = json['mommy_name'];
    address = json['address'];
    note = json['note'];
    avatar = json['avatar'];
    phoneNumber = json['phone_number'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['birthday'] = this.birthday;
    data['birthplace'] = this.birthplace;
    data['region'] = this.region;
    data['status'] = this.status;
    data['family_relationship'] = this.familyRelationship;
    data['education'] = this.education;
    data['daddy_name'] = this.daddyName;
    data['mommy_name'] = this.mommyName;
    data['address'] = this.address;
    data['note'] = this.note;
    data['avatar'] = this.avatar;
    data['phone_number'] = this.phoneNumber;
    data['created_at'] = this.createdAt;
    return data;
  }
}

