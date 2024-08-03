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
  String? phones;
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
        this.dateUpdate});

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
    phones = json['phones'];
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
    return data;
  }
}