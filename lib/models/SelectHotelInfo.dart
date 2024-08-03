class SelectHotelInfo {
  Hotel? hotel;
  List<Rooms>? rooms;
  int? numRooms;
  Filter? filter;
  int? numFilter;

  SelectHotelInfo(
      {this.hotel, this.rooms, this.numRooms, this.filter, this.numFilter});

  SelectHotelInfo.fromJson(Map<String, dynamic> json) {
    hotel = json['hotel'] != null ? Hotel.fromJson(json['hotel']) : null;
    if (json['rooms'] != null) {
      rooms = <Rooms>[];
      json['rooms'].forEach((v) {
        rooms!.add(Rooms.fromJson(v));
      });
    }
    numRooms = json['num_rooms'];
    filter =
    json['filter'] != null ? Filter.fromJson(json['filter']) : null;
    numFilter = json['num_filter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (hotel != null) {
      data['hotel'] = hotel!.toJson();
    }
    if (rooms != null) {
      data['rooms'] = rooms!.map((v) => v.toJson()).toList();
    }
    data['num_rooms'] = numRooms;
    if (filter != null) {
      data['filter'] = filter!.toJson();
    }
    data['num_filter'] = numFilter;
    return data;
  }

}

class Hotel {
  String? id;
  String? parentId;
  String? districtId;
  String? title;
  String? titleMenu;
  String? titleMenu2;
  String? h1;
  String? h2;
  String? img;
  String? bg;
  String? alias;
  String? address;
  String? addressFull;
  String? lat;
  String? lng;
  String? metro;
  String? metroColor;
  String? metroDistance;
  String? panoram;
  String? shedule;
  List<String>? phone;
  String? phoneGoal;
  String? email;
  String? socialnumber;
  String? tour;
  String? reach;
  String? reachMap;
  String? reachFacade;
  String? rules;
  String? cafe;
  String? memo;
  String? content;
  String? content2;
  String? optionGroup;
  String? about;
  String? location;
  String? infrastructure;
  String? rooms;
  String? extras;
  String? whoSuitable;
  String? attraction;
  String? imgAttraction;
  String? imgAttractionSm1;
  String? imgAttractionSm2;
  String? imgAttractionSm3;
  String? img1;
  String? img2;
  String? img3;
  String? img4;
  String? img5;
  String? img6;
  String? img7;
  String? img8;
  String? img9;
  String? goTransport;
  String? goWalking;
  String? metaTitle;
  String? metaDesc;
  String? metaKeys;
  String? tpl;
  String? childTpl;
  String? isUse;
  String? isDeleted;
  String? sortkey;
  String? indexSortkey;
  String? dateAdd;
  String? dateUpdate;
  String? amenities;
  int? numPhone;

  Hotel(
      {this.id,
        this.parentId,
        this.districtId,
        this.title,
        this.titleMenu,
        this.titleMenu2,
        this.h1,
        this.h2,
        this.img,
        this.bg,
        this.alias,
        this.address,
        this.addressFull,
        this.lat,
        this.lng,
        this.metro,
        this.metroColor,
        this.metroDistance,
        this.panoram,
        this.shedule,
        this.phone,
        this.phoneGoal,
        this.email,
        this.socialnumber,
        this.tour,
        this.reach,
        this.reachMap,
        this.reachFacade,
        this.rules,
        this.cafe,
        this.memo,
        this.content,
        this.content2,
        this.optionGroup,
        this.about,
        this.location,
        this.infrastructure,
        this.rooms,
        this.extras,
        this.whoSuitable,
        this.attraction,
        this.imgAttraction,
        this.imgAttractionSm1,
        this.imgAttractionSm2,
        this.imgAttractionSm3,
        this.img1,
        this.img2,
        this.img3,
        this.img4,
        this.img5,
        this.img6,
        this.img7,
        this.img8,
        this.img9,
        this.goTransport,
        this.goWalking,
        this.metaTitle,
        this.metaDesc,
        this.metaKeys,
        this.tpl,
        this.childTpl,
        this.isUse,
        this.isDeleted,
        this.sortkey,
        this.indexSortkey,
        this.dateAdd,
        this.dateUpdate,
        this.amenities,
        this.numPhone});

  Hotel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    districtId = json['district_id'];
    title = json['title'];
    titleMenu = json['title_menu'];
    titleMenu2 = json['title_menu2'];
    h1 = json['h1'];
    h2 = json['h2'];
    img = json['img'];
    bg = json['bg'];
    alias = json['alias'];
    address = json['address'];
    addressFull = json['address_full'];
    lat = json['lat'];
    lng = json['lng'];
    metro = json['metro'];
    metroColor = json['metro_color'];
    metroDistance = json['metro_distance'];
    panoram = json['panoram'];
    shedule = json['shedule'];
    phone = json['phone'].cast<String>();
    phoneGoal = json['phone_goal'];
    email = json['email'];
    socialnumber = json['socialnumber'];
    tour = json['tour'];
    reach = json['reach'];
    reachMap = json['reach_map'];
    reachFacade = json['reach_facade'];
    rules = json['rules'];
    cafe = json['cafe'];
    memo = json['memo'];
    content = json['content'];
    content2 = json['content2'];
    optionGroup = json['option_group'];
    about = json['about'];
    location = json['location'];
    infrastructure = json['infrastructure'];
    rooms = json['rooms'];
    extras = json['extras'];
    whoSuitable = json['who_suitable'];
    attraction = json['attraction'];
    imgAttraction = json['img_attraction'];
    imgAttractionSm1 = json['img_attraction_sm1'];
    imgAttractionSm2 = json['img_attraction_sm2'];
    imgAttractionSm3 = json['img_attraction_sm3'];
    img1 = json['img1'];
    img2 = json['img2'];
    img3 = json['img3'];
    img4 = json['img4'];
    img5 = json['img5'];
    img6 = json['img6'];
    img7 = json['img7'];
    img8 = json['img8'];
    img9 = json['img9'];
    goTransport = json['go_transport'];
    goWalking = json['go_walking'];
    metaTitle = json['meta_title'];
    metaDesc = json['meta_desc'];
    metaKeys = json['meta_keys'];
    tpl = json['tpl'];
    childTpl = json['child_tpl'];
    isUse = json['is_use'];
    isDeleted = json['is_deleted'];
    sortkey = json['sortkey'];
    indexSortkey = json['index_sortkey'];
    dateAdd = json['date_add'];
    dateUpdate = json['date_update'];
    amenities = json['amenities'];
    numPhone = json['num_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['parent_id'] = parentId;
    data['district_id'] = districtId;
    data['title'] = title;
    data['title_menu'] = titleMenu;
    data['title_menu2'] = titleMenu2;
    data['h1'] = h1;
    data['h2'] = h2;
    data['img'] = img;
    data['bg'] = bg;
    data['alias'] = alias;
    data['address'] = address;
    data['address_full'] = addressFull;
    data['lat'] = lat;
    data['lng'] = lng;
    data['metro'] = metro;
    data['metro_color'] = metroColor;
    data['metro_distance'] = metroDistance;
    data['panoram'] = panoram;
    data['shedule'] = shedule;
    data['phone'] = phone;
    data['phone_goal'] = phoneGoal;
    data['email'] = email;
    data['socialnumber'] = socialnumber;
    data['tour'] = tour;
    data['reach'] = reach;
    data['reach_map'] = reachMap;
    data['reach_facade'] = reachFacade;
    data['rules'] = rules;
    data['cafe'] = cafe;
    data['memo'] = memo;
    data['content'] = content;
    data['content2'] = content2;
    data['option_group'] = optionGroup;
    data['about'] = about;
    data['location'] = location;
    data['infrastructure'] = infrastructure;
    data['rooms'] = rooms;
    data['extras'] = extras;
    data['who_suitable'] = whoSuitable;
    data['attraction'] = attraction;
    data['img_attraction'] = imgAttraction;
    data['img_attraction_sm1'] = imgAttractionSm1;
    data['img_attraction_sm2'] = imgAttractionSm2;
    data['img_attraction_sm3'] = imgAttractionSm3;
    data['img1'] = img1;
    data['img2'] = img2;
    data['img3'] = img3;
    data['img4'] = img4;
    data['img5'] = img5;
    data['img6'] = img6;
    data['img7'] = img7;
    data['img8'] = img8;
    data['img9'] = img9;
    data['go_transport'] = goTransport;
    data['go_walking'] = goWalking;
    data['meta_title'] = metaTitle;
    data['meta_desc'] = metaDesc;
    data['meta_keys'] = metaKeys;
    data['tpl'] = tpl;
    data['child_tpl'] = childTpl;
    data['is_use'] = isUse;
    data['is_deleted'] = isDeleted;
    data['sortkey'] = sortkey;
    data['index_sortkey'] = indexSortkey;
    data['date_add'] = dateAdd;
    data['date_update'] = dateUpdate;
    data['amenities'] = amenities;
    data['num_phone'] = numPhone;
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
    price = json['price'] != null ? Price.fromJson(json['price']) : null;
    image = json['image'];
    imageAlt = json['image_alt'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    numImages = json['num_images'];
    homeSortkey = json['home_sortkey'];
    useDay = json['use_day'];
    useNight = json['use_night'];
    useHour = json['use_hour'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['hotel_id'] = hotelId;
    data['title'] = title;
    data['url'] = url;
    if (price != null) {
      data['price'] = price!.toJson();
    }
    data['image'] = image;
    data['image_alt'] = imageAlt;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['num_images'] = numImages;
    data['home_sortkey'] = homeSortkey;
    data['use_day'] = useDay;
    data['use_night'] = useNight;
    data['use_hour'] = useHour;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hour'] = hour;
    data['hour_min'] = hourMin;
    data['period'] = period;
    data['period_num'] = periodNum;
    data['night'] = night;
    data['night_old'] = nightOld;
    data['night_from'] = nightFrom;
    data['night_to'] = nightTo;
    data['price'] = price;
    data['price_old'] = priceOld;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['photo'] = photo;
    data['title'] = title;
    data['ext'] = ext;
    data['size'] = size;
    data['w'] = w;
    data['h'] = h;
    data['is_default'] = isDefault;
    return data;
  }
}

class Filter {
  F1? f1;
  F1? f2;
  F1? f3;
  F1? f4;
  F1? f5;
  F1? f6;
  F1? f7;

  Filter({this.f1, this.f2, this.f3, this.f4, this.f5, this.f6, this.f7});

  Filter.fromJson(Map<String, dynamic> json) {
    f1 = json['1'] != null ? F1.fromJson(json['1']) : null;
    f2 = json['2'] != null ? F1.fromJson(json['2']) : null;
    f3 = json['3'] != null ? F1.fromJson(json['3']) : null;
    f4 = json['4'] != null ? F1.fromJson(json['4']) : null;
    f5 = json['5'] != null ? F1.fromJson(json['5']) : null;
    f6 = json['6'] != null ? F1.fromJson(json['6']) : null;
    f7 = json['7'] != null ? F1.fromJson(json['7']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (f1 != null) {
      data['1'] = f1!.toJson();
    }
    if (f2 != null) {
      data['2'] = f2!.toJson();
    }
    if (f3 != null) {
      data['3'] = f3!.toJson();
    }
    if (f4 != null) {
      data['4'] = f4!.toJson();
    }
    if (f5 != null) {
      data['5'] = f5!.toJson();
    }
    if (f6 != null) {
      data['6'] = f6!.toJson();
    }
    if (f7 != null) {
      data['7'] = f7!.toJson();
    }
    return data;
  }
}

class F1 {
  String? id;
  String? title;
  String? isUse;
  String? sortkey;

  F1({this.id, this.title, this.isUse, this.sortkey});

  F1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isUse = json['is_use'];
    sortkey = json['sortkey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['is_use'] = isUse;
    data['sortkey'] = sortkey;
    return data;
  }
}