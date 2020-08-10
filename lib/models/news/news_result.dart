class NewsResult {
  List<News> result;
  Pagination pagination;
  String error;
  int code;

  NewsResult({this.result, this.pagination});

  NewsResult.fromJson(int statusCode,Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = new List<News>();
      json['result'].forEach((v) {
        result.add(new News.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    code = statusCode;
  }

  NewsResult.withError(Map<String, dynamic> json) {
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

class News {
  String id;
  String villageId;
  Category category;
  String title;
  String description;
  String link;
  String thumbnail;
  String content;
  String created_at;
  Category creator;

  News(
      {this.id,
        this.villageId,
        this.category,
        this.title,
        this.description,
        this.link,
        this.thumbnail,
        this.created_at,
        this.content,
        this.creator});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    villageId = json['village_id'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    title = json['title'];
    description = json['description'];
    link = json['link'];
    thumbnail = json['thumbnail'];
    content = json['content'];
    created_at = json['created_at'];
    creator =
    json['creator'] != null ? new Category.fromJson(json['creator']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['village_id'] = this.villageId;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    data['title'] = this.title;
    data['description'] = this.description;
    data['link'] = this.link;
    data['thumbnail'] = this.thumbnail;
    data['created_at'] = this.created_at;
    data['content'] = this.content;
    if (this.creator != null) {
      data['creator'] = this.creator.toJson();
    }
    return data;
  }
}

class Category {
  String id;
  String name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
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

