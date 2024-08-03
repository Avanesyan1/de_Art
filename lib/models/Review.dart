class Review {
  String? id;
  String? hotelId;
  String? name;
  String? text;
  String? dateAdd;

  Review({this.id, this.hotelId, this.name, this.text, this.dateAdd});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotelId = json['hotel_id'];
    name = json['name'];
    text = json['text'];
    dateAdd = json['date_add'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hotel_id'] = this.hotelId;
    data['name'] = this.name;
    data['text'] = this.text;
    data['date_add'] = this.dateAdd;
    return data;
  }
}