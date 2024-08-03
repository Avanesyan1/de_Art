class SelectPageInfo {
  bool? success;
  Filter? filter;
  int? numFilter;
  Page? page;
  Hotel? hotel;
  List<Items>? items;
  int? numItems;
  Hotels? hotels;
  int? numHotels;

  SelectPageInfo(
      {this.success,
        this.filter,
        this.numFilter,
        this.page,
        this.hotel,
        this.items,
        this.numItems,
        this.hotels,
        this.numHotels});

  SelectPageInfo.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    filter =
    json['filter'] != null ? new Filter.fromJson(json['filter']) : null;
    numFilter = json['num_filter'];
    page = json['page'] != null ? new Page.fromJson(json['page']) : null;
    hotel = json['hotel'] != null ? new Hotel.fromJson(json['hotel']) : null;
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    numItems = json['num_items'];
    hotels =
    json['hotels'] != null ? new Hotels.fromJson(json['hotels']) : null;
    numHotels = json['num_hotels'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.filter != null) {
      data['filter'] = this.filter!.toJson();
    }
    data['num_filter'] = this.numFilter;
    if (this.page != null) {
      data['page'] = this.page!.toJson();
    }
    if (this.hotel != null) {
      data['hotel'] = this.hotel!.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['num_items'] = this.numItems;
    if (this.hotels != null) {
      data['hotels'] = this.hotels!.toJson();
    }
    data['num_hotels'] = this.numHotels;
    return data;
  }
}

class Filter {
  F1? f1;
  F1? f2;
  F1? f3;
  F1? f4;
  F1? f5;

  Filter({this.f1, this.f2, this.f3, this.f4, this.f5});

  Filter.fromJson(Map<String, dynamic> json) {
    f1 = json['1'] != null ? new F1.fromJson(json['1']) : null;
    f2 = json['2'] != null ? new F1.fromJson(json['2']) : null;
    f3 = json['3'] != null ? new F1.fromJson(json['3']) : null;
    f4 = json['4'] != null ? new F1.fromJson(json['4']) : null;
    f5 = json['5'] != null ? new F1.fromJson(json['5']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.f1 != null) {
      data['1'] = this.f1!.toJson();
    }
    if (this.f2 != null) {
      data['2'] = this.f2!.toJson();
    }
    if (this.f3 != null) {
      data['3'] = this.f3!.toJson();
    }
    if (this.f4 != null) {
      data['4'] = this.f4!.toJson();
    }
    if (this.f5 != null) {
      data['5'] = this.f5!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['is_use'] = this.isUse;
    data['sortkey'] = this.sortkey;
    return data;
  }
}

class Page {
  String? id;
  String? sectionId;
  String? hotelId;
  String? title;
  String? h1;
  String? alias;
  String? metro;
  String? metroDistance;
  String? address;
  List<String>? phones;
  String? memo;
  String? content;
  String? content2;
  String? getthere;
  String? rooms;
  String? about;
  String? whoSuitable;
  String? attraction;
  String? imgAttraction;
  String? imgAttractionSm1;
  String? imgAttractionSm2;
  String? imgAttractionSm3;
  String? reach;
  String? reachMap;
  String? metaTitle;
  String? metaDesc;
  String? metaKeys;
  String? isPriceHour;
  String? isPriceNight;
  String? isPriceDay;
  String? isUse;
  String? isHideonlist;
  String? isHotels;
  String? tpl;
  String? dateAdd;
  String? dateUpdate;
  String? ogTitle;
  String? ogDesc;
  String? ogImage;
  String? ogUrl;
  int? numPhone;

  Page(
      {this.id,
        this.sectionId,
        this.hotelId,
        this.title,
        this.h1,
        this.alias,
        this.metro,
        this.metroDistance,
        this.address,
        this.phones,
        this.memo,
        this.content,
        this.content2,
        this.getthere,
        this.rooms,
        this.about,
        this.whoSuitable,
        this.attraction,
        this.imgAttraction,
        this.imgAttractionSm1,
        this.imgAttractionSm2,
        this.imgAttractionSm3,
        this.reach,
        this.reachMap,
        this.metaTitle,
        this.metaDesc,
        this.metaKeys,
        this.isPriceHour,
        this.isPriceNight,
        this.isPriceDay,
        this.isUse,
        this.isHideonlist,
        this.isHotels,
        this.tpl,
        this.dateAdd,
        this.dateUpdate,
        this.ogTitle,
        this.ogDesc,
        this.ogImage,
        this.ogUrl,
        this.numPhone});

  Page.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sectionId = json['section_id'];
    hotelId = json['hotel_id'];
    title = json['title'];
    h1 = json['h1'];
    alias = json['alias'];
    metro = json['metro'];
    metroDistance = json['metro_distance'];
    address = json['address'];
    phones = json['phones'].cast<String>();
    memo = json['memo'];
    content = json['content'];
    content2 = json['content2'];
    getthere = json['getthere'];
    rooms = json['rooms'];
    about = json['about'];
    whoSuitable = json['who_suitable'];
    attraction = json['attraction'];
    imgAttraction = json['img_attraction'];
    imgAttractionSm1 = json['img_attraction_sm1'];
    imgAttractionSm2 = json['img_attraction_sm2'];
    imgAttractionSm3 = json['img_attraction_sm3'];
    reach = json['reach'];
    reachMap = json['reach_map'];
    metaTitle = json['meta_title'];
    metaDesc = json['meta_desc'];
    metaKeys = json['meta_keys'];
    isPriceHour = json['is_price_hour'];
    isPriceNight = json['is_price_night'];
    isPriceDay = json['is_price_day'];
    isUse = json['is_use'];
    isHideonlist = json['is_hideonlist'];
    isHotels = json['is_hotels'];
    tpl = json['tpl'];
    dateAdd = json['date_add'];
    dateUpdate = json['date_update'];
    ogTitle = json['og_title'];
    ogDesc = json['og_desc'];
    ogImage = json['og_image'];
    ogUrl = json['og_url'];
    numPhone = json['num_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['section_id'] = this.sectionId;
    data['hotel_id'] = this.hotelId;
    data['title'] = this.title;
    data['h1'] = this.h1;
    data['alias'] = this.alias;
    data['metro'] = this.metro;
    data['metro_distance'] = this.metroDistance;
    data['address'] = this.address;
    data['phones'] = this.phones;
    data['memo'] = this.memo;
    data['content'] = this.content;
    data['content2'] = this.content2;
    data['getthere'] = this.getthere;
    data['rooms'] = this.rooms;
    data['about'] = this.about;
    data['who_suitable'] = this.whoSuitable;
    data['attraction'] = this.attraction;
    data['img_attraction'] = this.imgAttraction;
    data['img_attraction_sm1'] = this.imgAttractionSm1;
    data['img_attraction_sm2'] = this.imgAttractionSm2;
    data['img_attraction_sm3'] = this.imgAttractionSm3;
    data['reach'] = this.reach;
    data['reach_map'] = this.reachMap;
    data['meta_title'] = this.metaTitle;
    data['meta_desc'] = this.metaDesc;
    data['meta_keys'] = this.metaKeys;
    data['is_price_hour'] = this.isPriceHour;
    data['is_price_night'] = this.isPriceNight;
    data['is_price_day'] = this.isPriceDay;
    data['is_use'] = this.isUse;
    data['is_hideonlist'] = this.isHideonlist;
    data['is_hotels'] = this.isHotels;
    data['tpl'] = this.tpl;
    data['date_add'] = this.dateAdd;
    data['date_update'] = this.dateUpdate;
    data['og_title'] = this.ogTitle;
    data['og_desc'] = this.ogDesc;
    data['og_image'] = this.ogImage;
    data['og_url'] = this.ogUrl;
    data['num_phone'] = this.numPhone;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    data['district_id'] = this.districtId;
    data['title'] = this.title;
    data['title_menu'] = this.titleMenu;
    data['title_menu2'] = this.titleMenu2;
    data['h1'] = this.h1;
    data['h2'] = this.h2;
    data['img'] = this.img;
    data['bg'] = this.bg;
    data['alias'] = this.alias;
    data['address'] = this.address;
    data['address_full'] = this.addressFull;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['metro'] = this.metro;
    data['metro_color'] = this.metroColor;
    data['metro_distance'] = this.metroDistance;
    data['panoram'] = this.panoram;
    data['shedule'] = this.shedule;
    data['phone'] = this.phone;
    data['phone_goal'] = this.phoneGoal;
    data['email'] = this.email;
    data['socialnumber'] = this.socialnumber;
    data['tour'] = this.tour;
    data['reach'] = this.reach;
    data['reach_map'] = this.reachMap;
    data['reach_facade'] = this.reachFacade;
    data['rules'] = this.rules;
    data['cafe'] = this.cafe;
    data['memo'] = this.memo;
    data['content'] = this.content;
    data['content2'] = this.content2;
    data['option_group'] = this.optionGroup;
    data['about'] = this.about;
    data['location'] = this.location;
    data['infrastructure'] = this.infrastructure;
    data['rooms'] = this.rooms;
    data['extras'] = this.extras;
    data['who_suitable'] = this.whoSuitable;
    data['attraction'] = this.attraction;
    data['img_attraction'] = this.imgAttraction;
    data['img_attraction_sm1'] = this.imgAttractionSm1;
    data['img_attraction_sm2'] = this.imgAttractionSm2;
    data['img_attraction_sm3'] = this.imgAttractionSm3;
    data['img1'] = this.img1;
    data['img2'] = this.img2;
    data['img3'] = this.img3;
    data['img4'] = this.img4;
    data['img5'] = this.img5;
    data['img6'] = this.img6;
    data['img7'] = this.img7;
    data['img8'] = this.img8;
    data['img9'] = this.img9;
    data['go_transport'] = this.goTransport;
    data['go_walking'] = this.goWalking;
    data['meta_title'] = this.metaTitle;
    data['meta_desc'] = this.metaDesc;
    data['meta_keys'] = this.metaKeys;
    data['tpl'] = this.tpl;
    data['child_tpl'] = this.childTpl;
    data['is_use'] = this.isUse;
    data['is_deleted'] = this.isDeleted;
    data['sortkey'] = this.sortkey;
    data['index_sortkey'] = this.indexSortkey;
    data['date_add'] = this.dateAdd;
    data['date_update'] = this.dateUpdate;
    data['amenities'] = this.amenities;
    data['num_phone'] = this.numPhone;
    return data;
  }
}

class Items {
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

  Items(
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

  Items.fromJson(Map<String, dynamic> json) {
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

class Hotels {
  H2? h2;

  Hotels({this.h2});

  Hotels.fromJson(Map<String, dynamic> json) {

    if (json['1']!=null){h2 =new H2.fromJson(json['1']);}
    else if(json['2']!=null){h2 =new H2.fromJson(json['2']);}
    else if(json['4']!=null){h2 =new H2.fromJson(json['4']);}
    else if(json['5']!=null){h2=new H2.fromJson(json['5']);}
    else if(json['6']!=null){h2=new H2.fromJson(json['6']);}
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.h2 != null) {
      data['2'] = this.h2!.toJson();
    }
    return data;
  }
}

class H2 {
  String? id;
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
  String? phones;

  H2(
      {this.id,
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
        this.phones});

  H2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    phones = json['phones'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
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
    data['phones'] = this.phones;
    return data;
  }
}