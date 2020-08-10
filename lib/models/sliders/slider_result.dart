class SliderResult {
  List<SliderBanner> result;
  Pagination pagination;

  String error;
  int code;

  SliderResult({this.result, this.pagination});

  SliderResult.fromJson(int statusCode,Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = new List<SliderBanner>();
      json['result'].forEach((v) {
        result.add(new SliderBanner.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    code = statusCode;
  }

  SliderResult.withError(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination.toJson();
    }
    return data;
  }
}

class SliderBanner {
  String id;
  String villageId;
  String title;
  String description;
  String link;
  String image;
  int order;
  Creator creator;

  SliderBanner(
      {this.id,
        this.villageId,
        this.title,
        this.description,
        this.link,
        this.image,
        this.order,
        this.creator});

  SliderBanner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    villageId = json['village_id'];
    title = json['title'];
    description = json['description'];
    link = json['link'];
    image = json['image'];
    order = json['order'];
    creator =
    json['creator'] != null ? new Creator.fromJson(json['creator']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['village_id'] = this.villageId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['link'] = this.link;
    data['image'] = this.image;
    data['order'] = this.order;
    if (this.creator != null) {
      data['creator'] = this.creator.toJson();
    }
    return data;
  }
}

class Creator {
  String id;
  String name;

  Creator({this.id, this.name});

  Creator.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Pagination {
  int total;
  int count;
  int perPage;
  int currentPage;
  int totalPages;

  Pagination(
      {this.total,
        this.count,
        this.perPage,
        this.currentPage,
        this.totalPages});

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    count = json['count'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['count'] = this.count;
    data['per_page'] = this.perPage;
    data['current_page'] = this.currentPage;
    data['total_pages'] = this.totalPages;
    return data;
  }
}

