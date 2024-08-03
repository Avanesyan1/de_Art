class AllHotelsInfo {
  Hotels? hotels;

  AllHotelsInfo({this.hotels});

  AllHotelsInfo.fromJson(Map<String, dynamic> json) {
    hotels =
    json['hotels'] != null ? new Hotels.fromJson(json['hotels']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hotels != null) {
      data['hotels'] = this.hotels!.toJson();
    }
    return data;
  }
}

class Hotels {
  H1? h1;
  H1? h4;
  H1? h2;
  H1? h5;
  H1? h6;
  H1? h7;

  Hotels({this.h1, this.h4, this.h2, this.h5, this.h6, this.h7});

  Hotels.fromJson(Map<String, dynamic> json) {
    h1 = json['1'] != null ? new H1.fromJson(json['1']) : null;
    h4 = json['4'] != null ? new H1.fromJson(json['4']) : null;
    h2 = json['2'] != null ? new H1.fromJson(json['2']) : null;
    h5 = json['5'] != null ? new H1.fromJson(json['5']) : null;
    h6 = json['6'] != null ? new H1.fromJson(json['6']) : null;
    h7 = json['7'] != null ? new H1.fromJson(json['7']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.h1 != null) {
      data['1'] = this.h1!.toJson();
    }
    if (this.h4 != null) {
      data['4'] = this.h4!.toJson();
    }
    if (this.h2 != null) {
      data['2'] = this.h2!.toJson();
    }
    if (this.h5 != null) {
      data['5'] = this.h5!.toJson();
    }
    if (this.h6 != null) {
      data['6'] = this.h6!.toJson();
    }
    if (this.h6 != null) {
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
  String? location;
  String? infrastructure;
  String? rooms;
  String? extras;
  String? reachFacade;
  String? phones;

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
        this.location,
        this.infrastructure,
        this.rooms,
        this.extras,
        this.reachFacade,
        this.phones});

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
    location = json['location'];
    infrastructure = json['infrastructure'];
    rooms = json['rooms'];
    extras = json['extras'];
    reachFacade = json['reach_facade'];
    phones = json['phones'];
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
    data['location'] = this.location;
    data['infrastructure'] = this.infrastructure;
    data['rooms'] = this.rooms;
    data['extras'] = this.extras;
    data['reach_facade'] = this.reachFacade;
    data['phones'] = this.phones;
    return data;
  }
}