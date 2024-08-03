class SelectRoomInfo {
  int? id;
  int? roomId;
  int? sectionId;
  String? title;
  String? titleLand;
  int? sortkey;
  String? alias;
  String? options;
  int? priceHour;
  String? descr;
  int? noSmoking;
  int? isCot;
  String? bed;
  String? bath;
  String? equipmentList;
  List<String>? equipment;
  String? equipmentOther;
  String? food;
  String? metaTitle;
  String? metaDesc;
  String? metaKeys;
  int? isVip;
  int? isAction;
  int? onHome;
  int? homeSortkey;
  int? isUse;
  int? isDeleted;
  String? dateAdd;
  String? dateUpdate;
  String? ogTitle;
  String? ogDesc;
  String? ogImage;
  String? ogUrl;
  List<Images>? images;
  int? numImages;
  Price? price;
  int? useDay;
  int? useNight;
  int? useHour;
  List<String>? onroombig ;
  List<String>? onroom;
  int? numOnroom;
  int? numOnroombig;
  int? isJacuzzi;
  int? isAc;

  SelectRoomInfo(
      {this.id,
        this.roomId,
        this.sectionId,
        this.title,
        this.titleLand,
        this.sortkey,
        this.alias,
        this.options,
        this.priceHour,
        this.descr,
        this.noSmoking,
        this.isCot,
        this.bed,
        this.bath,
        this.equipmentList,
        this.equipment,
        this.equipmentOther,
        this.food,
        this.metaTitle,
        this.metaDesc,
        this.metaKeys,
        this.isVip,
        this.isAction,
        this.onHome,
        this.homeSortkey,
        this.isUse,
        this.isDeleted,
        this.dateAdd,
        this.dateUpdate,
        this.ogTitle,
        this.ogDesc,
        this.ogImage,
        this.ogUrl,
        this.images,
        this.numImages,
        this.price,
        this.useDay,
        this.useNight,
        this.useHour,
        this.onroombig,
        this.onroom,
        this.numOnroom,
        this.numOnroombig,
        this.isJacuzzi,
        this.isAc});

  SelectRoomInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomId = json['room_id'];
    sectionId = json['section_id'];
    title = json['title'];
    titleLand = json['title_land'];
    sortkey = json['sortkey'];
    alias = json['alias'];
    options = json['options'].toString();
    priceHour = json['price_hour'];
    descr = json['descr'];
    noSmoking = json['no_smoking'];
    isCot = json['is_cot'];
    bed = json['bed'];
    bath = json['bath'];
    equipmentList = json['equipment_list'];
    equipment = json['equipment']!=''? json['equipment'].cast<String>():[];
    equipmentOther = json['equipment_other'];
    food = json['food'];
    metaTitle = json['meta_title'];
    metaDesc = json['meta_desc'];
    metaKeys = json['meta_keys'];
    isVip = json['is_vip'];
    isAction = json['is_action'];
    onHome = json['on_home'];
    homeSortkey = json['home_sortkey'];
    isUse = json['is_use'];
    isDeleted = json['is_deleted'];
    dateAdd = json['date_add'];
    dateUpdate = json['date_update'];
    ogTitle = json['og_title'];
    ogDesc = json['og_desc'];
    ogImage = json['og_image'];
    ogUrl = json['og_url'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    numImages = json['num_images'];
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    useDay = json['use_day'];
    useNight = json['use_night'];
    useHour = json['use_hour'];
   if(json['onroombig']!=null) onroombig = json['onroombig'].cast<String>() ;
    if(json['onroom']!=null) onroom = json['onroom'].cast<String>();
    numOnroom = json['num_onroom'];
    numOnroombig = json['num_onroombig'];
    isJacuzzi = json['is_jacuzzi'];
    isAc = json['is_ac'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['room_id'] = this.roomId;
    data['section_id'] = this.sectionId;
    data['title'] = this.title;
    data['title_land'] = this.titleLand;
    data['sortkey'] = this.sortkey;
    data['alias'] = this.alias;
    data['options'] = this.options;
    data['price_hour'] = this.priceHour;
    data['descr'] = this.descr;
    data['no_smoking'] = this.noSmoking;
    data['is_cot'] = this.isCot;
    data['bed'] = this.bed;
    data['bath'] = this.bath;
    data['equipment_list'] = this.equipmentList;
    data['equipment'] = this.equipment;
    data['equipment_other'] = this.equipmentOther;
    data['food'] = this.food;
    data['meta_title'] = this.metaTitle;
    data['meta_desc'] = this.metaDesc;
    data['meta_keys'] = this.metaKeys;
    data['is_vip'] = this.isVip;
    data['is_action'] = this.isAction;
    data['on_home'] = this.onHome;
    data['home_sortkey'] = this.homeSortkey;
    data['is_use'] = this.isUse;
    data['is_deleted'] = this.isDeleted;
    data['date_add'] = this.dateAdd;
    data['date_update'] = this.dateUpdate;
    data['og_title'] = this.ogTitle;
    data['og_desc'] = this.ogDesc;
    data['og_image'] = this.ogImage;
    data['og_url'] = this.ogUrl;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['num_images'] = this.numImages;
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    data['use_day'] = this.useDay;
    data['use_night'] = this.useNight;
    data['use_hour'] = this.useHour;
    data['onroombig'] = this.onroombig;
    data['onroom'] = this.onroom;
    data['num_onroom'] = this.numOnroom;
    data['num_onroombig'] = this.numOnroombig;
    data['is_jacuzzi'] = this.isJacuzzi;
    data['is_ac'] = this.isAc;
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