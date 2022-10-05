class FoodMenuRes{
  String? message;
  MenuData? data;

  FoodMenuRes({this.message, this.data});

  FoodMenuRes.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new MenuData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class MenuData {
  int? restaurantId;
  String? name;
  List<MenuCategories>? categories;

  MenuData({this.restaurantId, this.name, this.categories});

  MenuData.fromJson(Map<String, dynamic> json) {
    restaurantId = json['restaurantId'];
    name = json['name'];
    if (json['categories'] != null) {
      categories = <MenuCategories>[];
      json['categories'].forEach((v) {
        categories!.add(new MenuCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['restaurantId'] = this.restaurantId;
    data['name'] = this.name;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MenuCategories {
  String? categoryName;
  int? totalCount;
  List<SubCategoryFoodItems>? subCategoryFoodItems;

  MenuCategories({this.categoryName, this.totalCount, this.subCategoryFoodItems});

  MenuCategories.fromJson(Map<String, dynamic> json) {
    categoryName = json['categoryName'];
    totalCount = json['totalCount'];
    if (json['subCategoryFoodItems'] != null) {
      subCategoryFoodItems = <SubCategoryFoodItems>[];
      json['subCategoryFoodItems'].forEach((v) {
        subCategoryFoodItems!.add(new SubCategoryFoodItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryName'] = this.categoryName;
    data['totalCount'] = this.totalCount;
    if (this.subCategoryFoodItems != null) {
      data['subCategoryFoodItems'] =
          this.subCategoryFoodItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategoryFoodItems {
  String? categoryName;
  List<MenuItems>? items;

  SubCategoryFoodItems({this.categoryName, this.items});

  SubCategoryFoodItems.fromJson(Map<String, dynamic> json) {
    categoryName = json['categoryName'];
    if (json['items'] != null) {
      items = <MenuItems>[];
      json['items'].forEach((v) {
        items!.add(new MenuItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryName'] = this.categoryName;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MenuItems {
  int? id;
  String? name;
  String? description;
  int? price;
  int? offerPrice;
  bool? isVegetarian;
  int? foodCategoryId;
  String? foodCategoryName;
  int? restaurantId;
  String? restaurantName;
  String? city;

  MenuItems(
      {this.id,
        this.name,
        this.description,
        this.price,
        this.offerPrice,
        this.isVegetarian,
        this.foodCategoryId,
        this.foodCategoryName,
        this.restaurantId,
        this.restaurantName,
        this.city});

  MenuItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    offerPrice = json['offerPrice'];
    isVegetarian = json['isVegetarian'];
    foodCategoryId = json['foodCategoryId'];
    foodCategoryName = json['foodCategoryName'];
    restaurantId = json['restaurantId'];
    restaurantName = json['restaurantName'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['offerPrice'] = this.offerPrice;
    data['isVegetarian'] = this.isVegetarian;
    data['foodCategoryId'] = this.foodCategoryId;
    data['foodCategoryName'] = this.foodCategoryName;
    data['restaurantId'] = this.restaurantId;
    data['restaurantName'] = this.restaurantName;
    data['city'] = this.city;
    return data;
  }
}