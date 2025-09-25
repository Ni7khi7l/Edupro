class Categories {
  String? category;
  double? rating;
  String? title;
  int? classes;
  int? durationHours;
  int? price;
  String? tab;
  String? conclusion;

  Categories({
    this.category,
    this.rating,
    this.title,
    this.classes,
    this.durationHours,
    this.price,
    this.tab,
    this.conclusion,
  });

  Categories.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    rating = json['rating'];
    title = json['title'];
    classes = json['classes'];
    durationHours = json['duration hours'];
    price = json['price'];
    tab = json['tab'];
    conclusion = json['conclusion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['rating'] = this.rating;
    data['title'] = this.title;
    data['classes'] = this.classes;
    data['duration hours'] = this.durationHours;
    data['price'] = this.price;
    data['tab'] = this.tab;
    data['conclusion'] = this.conclusion;
    return data;
  }
}
