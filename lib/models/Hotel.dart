class AllHotel {
  bool? success;
  Hotels? hotels;
  int? count;

  AllHotel({this.success, this.hotels, this.count});

  AllHotel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
  if  (json['count']!=0)
  {
    hotels = Hotels.fromJson(json['hotels']);
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.hotels != null) {
      data['hotels'] = this.hotels!.toJson();
    }
    data['count'] = this.count;
    return data;
  }
}

class Hotels {
  H1? h1;
  H1? h2;
  H1? h4;
  H1? h5;
  H1? h6;
  H1? h7;

  Hotels({this.h1, this.h2, this.h4, this.h5, this.h6,this.h7});

  Hotels.fromJson(Map<String, dynamic> json) {
    h1 = json['1'] != null ? new H1.fromJson(json['1']) : null;
    h2 = json['2'] != null ? new H1.fromJson(json['2']) : null;
    h4 = json['4'] != null ? new H1.fromJson(json['4']) : null;
    h5 = json['5'] != null ? new H1.fromJson(json['5']) : null;
    h6 = json['6'] != null ? new H1.fromJson(json['6']) : null;
    h7 = json['7'] != null ? new H1.fromJson(json['7']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.h1 != null) {
      data['1'] = this.h1!.toJson();
    }
    if (this.h2 != null) {
      data['2'] = this.h2!.toJson();
    }
    if (this.h4 != null) {
      data['4'] = this.h4!.toJson();
    }
    if (this.h5 != null) {
      data['5'] = this.h5!.toJson();
    }
    if (this.h6 != null) {
      data['6'] = this.h6!.toJson();
    }
    if (this.h7 != null) {
      data['7'] = this.h7!.toJson();
    }
    return data;
  }
}

class H1 {
  String? id;
  String? sTitle;
  String? title;
  String? titleE;
  String? url;
  String? img;
  String? metro;
  String? address;
  List<String>? phone;
  String? phoneGoal;
  int? numPhone;
  String? sphone;
  String? email;
  List<Rooms>? rooms;
  int? numRooms;

  H1(
      {this.id,
        this.sTitle,
        this.title,
        this.titleE,
        this.url,
        this.img,
        this.metro,
        this.address,
        this.phone,
        this.phoneGoal,
        this.numPhone,
        this.sphone,
        this.email,
        this.rooms,
        this.numRooms});

  H1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sTitle = json['_title'];
    title = json['title'];
    titleE = json['title_e'];
    url = json['url'];
    img = json['img'];
    metro = json['metro'];
    address = json['address'];
    phone = json['phone'].cast<String>();
    phoneGoal = json['phone_goal'];
    numPhone = json['num_phone'];
    sphone = json['sphone'];
    email = json['email'];
    if (json['rooms'] != null) {
      rooms = <Rooms>[];
      json['rooms'].forEach((v) {
        rooms!.add(new Rooms.fromJson(v));
      });
    }
    numRooms = json['num_rooms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['_title'] = this.sTitle;
    data['title'] = this.title;
    data['title_e'] = this.titleE;
    data['url'] = this.url;
    data['img'] = this.img;
    data['metro'] = this.metro;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['phone_goal'] = this.phoneGoal;
    data['num_phone'] = this.numPhone;
    data['sphone'] = this.sphone;
    data['email'] = this.email;
    if (this.rooms != null) {
      data['rooms'] = this.rooms!.map((v) => v.toJson()).toList();
    }
    data['num_rooms'] = this.numRooms;
    return data;
  }
}

class Rooms {
  String? id;
  String? hotelId;
  String? title;
  String? url;
  Price? price;
  String? image;
  String? imageAlt;
  List<Images>? images;
  int? numImages;
  String? homeSortkey;
  int? useDay;
  int? useNight;
  int? useHour;

  Rooms(
      {this.id,
        this.hotelId,
        this.title,
        this.url,
        this.price,
        this.image,
        this.imageAlt,
        this.images,
        this.numImages,
        this.homeSortkey,
        this.useDay,
        this.useNight,
        this.useHour});

  Rooms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotelId = json['hotel_id'];
    title = json['title'];
    url = json['url'];
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    image = json['image'];
    imageAlt = json['image_alt'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    numImages = json['num_images'];
    homeSortkey = json['home_sortkey'];
    useDay = json['use_day'];
    useNight = json['use_night'];
    useHour = json['use_hour'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hotel_id'] = this.hotelId;
    data['title'] = this.title;
    data['url'] = this.url;
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    data['image'] = this.image;
    data['image_alt'] = this.imageAlt;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['num_images'] = this.numImages;
    data['home_sortkey'] = this.homeSortkey;
    data['use_day'] = this.useDay;
    data['use_night'] = this.useNight;
    data['use_hour'] = this.useHour;
    return data;
  }
}

class Price {
  String? hour;
  String? hourMin;
  String? period;
  String? periodNum;
  String? night;
  String? nightOld;
  String? nightFrom;
  String? nightTo;
  String? price;
  String? priceOld;

  Price(
      {this.hour,
        this.hourMin,
        this.period,
        this.periodNum,
        this.night,
        this.nightOld,
        this.nightFrom,
        this.nightTo,
        this.price,
        this.priceOld});

  Price.fromJson(Map<String, dynamic> json) {
    hour = json['hour'];
    hourMin = json['hour_min'];
    period = json['period'];
    periodNum = json['period_num'];
    night = json['night'];
    nightOld = json['night_old'];
    nightFrom = json['night_from'];
    nightTo = json['night_to'];
    price = json['price'];
    priceOld = json['price_old'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hour'] = this.hour;
    data['hour_min'] = this.hourMin;
    data['period'] = this.period;
    data['period_num'] = this.periodNum;
    data['night'] = this.night;
    data['night_old'] = this.nightOld;
    data['night_from'] = this.nightFrom;
    data['night_to'] = this.nightTo;
    data['price'] = this.price;
    data['price_old'] = this.priceOld;
    return data;
  }
}

class Images {
  String? id;
  String? photo;
  String? title;
  String? ext;
  String? size;
  String? w;
  String? h;
  String? isDefault;

  Images(
      {this.id,
        this.photo,
        this.title,
        this.ext,
        this.size,
        this.w,
        this.h,
        this.isDefault});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    title = json['title'];
    ext = json['ext'];
    size = json['size'];
    w = json['w'];
    h = json['h'];
    isDefault = json['is_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['photo'] = this.photo;
    data['title'] = this.title;
    data['ext'] = this.ext;
    data['size'] = this.size;
    data['w'] = this.w;
    data['h'] = this.h;
    data['is_default'] = this.isDefault;
    return data;
  }
}