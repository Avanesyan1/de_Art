

// ignore_for_file: non_constant_identifier_names

import 'package:de_art/models/Page.dart' as allPage;
import 'package:de_art/models/SelectPageInfo.dart';
//import 'package:de_art/models/SelectHotelInfo.dart';
import 'package:dio/dio.dart';

import '../models/AllHotelsInfo.dart';
import '../models/Hotel.dart'as allList ;
import '../models/Review.dart';
import '../models/SelectHotelInfo.dart';
import '../models/SelectRoomInfo.dart';
import 'global.dart';


//var _res = List<Cell>.from(_json['cells'].map((model) => Cell.fromJson(model)));


Future all_list() async {
  print("all_list start ${DateTime.now()}");
  var dio = Dio();
  try {
    var response = await dio.get(
      "https://deart-13.ru/api/v1/index?token=bQWc9FDWI3DiEEYYk6lQvHwlAUjTfDrw",
    );
    final json = response.data;
    if ((response.statusCode == 200) & (json['success'] == true)) {

      allHotels = allList.AllHotel.fromJson(json) ;
print(allHotels.toString());
      print("all_list success ${DateTime.now()}");
      return "success";
    } else if (json['error'] != null) {
      print("all_list fail ${DateTime.now()} reason " +
          json["error"]);
      return json['error'];
    } else
      return "Неизвестная ошибка";
  } on DioException catch (e) {
    print("all_list fail ${DateTime.now()} reason $e");
    if (e.response != null) {
      return e.response.toString();
    } else {
      return e.message.toString();
    }
  }
}



Future all_pages() async {
  print("all_pages start ${DateTime.now()}");
  var dio = Dio();
  try {
    var response = await dio.get(
      "https://deart-13.ru/api/v1/pages?token=bQWc9FDWI3DiEEYYk6lQvHwlAUjTfDrw",
    );
    final json = response.data;
    if ((response.statusCode == 200) & (json['success'] == true)) {

      allPages =List<allPage.Page>.from(json['pages'].map((model) => allPage.Page.fromJson(model))) ;
//print(allPages.toString());
      print("all_pages success ${DateTime.now()}");
      return "success";
    } else if (json['error'] != null) {
      print("all_pages fail ${DateTime.now()} reason " +
          json["error"]);
      return json['error'];
    } else
      return "Неизвестная ошибка";
  } on DioException catch (e) {
    print("all_pages fail ${DateTime.now()} reason $e");
    if (e.response != null) {
      return e.response.toString();
    } else {
      return e.message.toString();
    }
  }
}



Future all_reviews() async {
  print("all_reviews start ${DateTime.now()}");
  var dio = Dio();
  try {
    var response = await dio.get(
      "https://deart-13.ru/api/v1/reviews?token=bQWc9FDWI3DiEEYYk6lQvHwlAUjTfDrw",
    );
    final json = response.data;
    if ((response.statusCode == 200) & (json['success'] == true)) {

      allReviews =List<Review>.from(json['guestbook'].map((model) => Review.fromJson(model))) ;
//print(allReviews.toString());
      print("all_reviews success ${DateTime.now()}");
      return "success";
    } else if (json['error'] != null) {
      print("all_reviews fail ${DateTime.now()} reason " +
          json["error"]);
      return json['error'];
    } else
      return "Неизвестная ошибка";
  } on DioException catch (e) {
    print("all_reviews fail ${DateTime.now()} reason $e");
    if (e.response != null) {
      return e.response.toString();
    } else {
      return e.message.toString();
    }
  }
}



Future all_hotels_info() async {
  print("all_hotels_info start ${DateTime.now()}");
  var dio = Dio();
  try {
    var response = await dio.get(
      "https://deart-13.ru/api/v1/hotels?token=bQWc9FDWI3DiEEYYk6lQvHwlAUjTfDrw",
    );
    final json = response.data;
    if ((response.statusCode == 200) & (json['success'] == true)) {

      allHotelsInfo = AllHotelsInfo.fromJson(json) ;
print(allHotelsInfo.toString());
      print("all_hotels_info success ${DateTime.now()}");
      return "success";
    } else if (json['error'] != null) {
      print("all_hotels_info fail ${DateTime.now()} reason " +
          json["error"]);
      return json['error'];
    } else
      return "Неизвестная ошибка";
  } on DioException catch (e) {
    print("all_hotels_info fail ${DateTime.now()} reason $e");
    if (e.response != null) {
      return e.response.toString();
    } else {
      return e.message.toString();
    }
  }
}



Future select_hotel_info(String id) async {
  print("select_hotel_info start ${DateTime.now()}");
  var dio = Dio();
  try {
    var response = await dio.get(
      "https://deart-13.ru/api/v1/hotel?id=$id&token=bQWc9FDWI3DiEEYYk6lQvHwlAUjTfDrw",
    );
    final json = response.data;
    if ((response.statusCode == 200) & (json['success'] == true)) {

     selectHotelInfo = SelectHotelInfo.fromJson(json) ;
      print(selectHotelInfo.toString());
      print("select_hotel_info success ${DateTime.now()}");
      return "success";
    } else if (json['error'] != null) {
      print("select_hotel_info fail ${DateTime.now()} reason " +
          json["error"]);
      return json['error'];
    } else
      return "Неизвестная ошибка";
  } on DioException catch (e) {
    print("select_hotel_info fail ${DateTime.now()} reason $e");
    if (e.response != null) {
      return e.response.toString();
    } else {
      return e.message.toString();
    }
  }
}


Future select_hotel_info_filter(String id, String filter) async {
  print("select_hotel_info start ${DateTime.now()}");
  print(id);
  print(filter);
  print( "https://deart-13.ru/api/v1/hotel?id=$id&token=bQWc9FDWI3DiEEYYk6lQvHwlAUjTfDrw&use_filter=Y&filter=$filter");
  var dio = Dio();
  try {
    var response = await dio.get(
      "https://deart-13.ru/api/v1/hotel?id=$id&token=bQWc9FDWI3DiEEYYk6lQvHwlAUjTfDrw&use_filter=Y&filter=$filter",
    );
    final json = response.data;
    if ((response.statusCode == 200) & (json['success'] == true)) {

      selectHotelInfo = SelectHotelInfo.fromJson(json) ;
      print(selectHotelInfo.toString());
      print("select_hotel_info success ${DateTime.now()}");
      return "success";
    } else if (json['error'] != null) {
      print("select_hotel_info fail ${DateTime.now()} reason " +
          json["error"]);
      return json['error'];
    } else
      return "Неизвестная ошибка";
  } on DioException catch (e) {
    print("select_hotel_info fail ${DateTime.now()} reason $e");
    if (e.response != null) {
      return e.response.toString();
    } else {
      return e.message.toString();
    }
  }
}



Future select_page_info(String id) async {
  print("select_page_info start ${DateTime.now()}");
  var dio = Dio();
  try {
    var response = await dio.get(
      "https://deart-13.ru/api/v1/page?token=bQWc9FDWI3DiEEYYk6lQvHwlAUjTfDrw&id=$id",
    );
    final json = response.data;
    if ((response.statusCode == 200) & (json['success'] == true)) {

      selectPageInfo = SelectPageInfo.fromJson(json) ;
      print(selectPageInfo.toString());
      print("select_page_info success ${DateTime.now()}");
      return "success";
    } else if (json['error'] != null) {
      print("select_page_info fail ${DateTime.now()} reason " +
          json["error"]);
      return json['error'];
    } else
      return "Неизвестная ошибка";
  } on DioException catch (e) {
    print("select_page_info fail ${DateTime.now()} reason $e");
    if (e.response != null) {
      return e.response.toString();
    } else {
      return e.message.toString();
    }
  }
}



Future select_room_info(String id) async {
  print("select_room_info start ${DateTime.now()}");
  var dio = Dio();
  try {
    var response = await dio.get(
      "https://deart-13.ru/api/v1/room?token=bQWc9FDWI3DiEEYYk6lQvHwlAUjTfDrw&id=$id",
    );
    final json = response.data;
    if ((response.statusCode == 200) & (json['success'] == true)) {

      selectRoomInfo = SelectRoomInfo.fromJson(json['room']) ;
      print(selectRoomInfo.toString());
      print("select_room_info success ${DateTime.now()}");
      return "success";
    } else if (json['error'] != null) {
      print("select_room_info fail ${DateTime.now()} reason " +
          json["error"]);
      return json['error'];
    } else
      return "Неизвестная ошибка";
  } on DioException catch (e) {
    print("select_room_info fail ${DateTime.now()} reason $e");
    if (e.response != null) {
      return e.response.toString();
    } else {
      return e.message.toString();
    }
  }
}

Future all_list_filters(
    String metroPROF,
    String metroVIH,
    String metroTAG,
    String metroTEKST,
    String metroKROP,
    String timeToWithdraw,
    String bed,
    String priceFrom,
    String priceTo,
    String typeEconomy,
    String typeLuxury,
    String typeDeluxe,
    String jacuzzi,
    String parking,
    String bar,
    ) async {
  print("all_list start ${DateTime.now()}");
  var dio = Dio();
  try {
    var response = await dio.get(
      "https://deart-13.ru/api/v1/index?token=bQWc9FDWI3DiEEYYk6lQvHwlAUjTfDrw&use_filter=Y$metroPROF&$metroVIH&$metroTAG&$metroTEKST&$metroKROP&$timeToWithdraw"
          "&$bed&$priceFrom&$priceTo&$typeEconomy&$typeLuxury&$typeDeluxe&$jacuzzi&$parking&$bar",
    );
    final json = response.data;
    if ((response.statusCode == 200) & (json['success'] == true)) {

      allHotels = allList.AllHotel.fromJson(json) ;
      print(allHotels.toString());
      print("all_list success ${DateTime.now()}");
      return "success";
    } else if (json['error'] != null) {
      print("all_list fail ${DateTime.now()} reason " +
          json["error"]);
      return json['error'];
    } else
      return "Неизвестная ошибка";
  } on DioException catch (e) {
    print("all_list fail ${DateTime.now()} reason $e");
    if (e.response != null) {
      return e.response.toString();
    } else {
      return e.message.toString();
    }
  }
}




Future leave_review(String hotelId, String name,String message) async {
  print("leave_review start ${DateTime.now()}");
  var dio = Dio();
  FormData formData =  FormData.fromMap({
    'hotel_id': hotelId,
    'name': name,
    'message': message,
  });

  try {
    var response = await dio.post(
      "https://deart-13.ru/api/v1/review?token=bQWc9FDWI3DiEEYYk6lQvHwlAUjTfDrw",
        data: formData

  /*    data: {
      'hotel_id': hotel_id,
      'name': name,
      'message': message,
    },*/
    );


    final json = response.data;
    if ((response.statusCode == 200) & (json['success'] == true)) {

      print("leave_review success ${DateTime.now()}");
      return "success";
    } else if (json['reason'] != null) {
      print("leave_review fail ${DateTime.now()} reason " +
          json["reason"]);
      return json['reason'];
    } else
      return "Неизвестная ошибка";
  } on DioException catch (e) {
    print("leave_review fail ${DateTime.now()} reason $e");
    if (e.response != null) {
      return e.response.toString();
    } else {
      return e.message.toString();
    }
  }
}


Future recall (String name, String phone,String? message) async {
  print("recall start ${DateTime.now()}");
  var dio = Dio();

  FormData formData =  FormData.fromMap({
    'phone': phone,
    'name': name,
    'message': message,
  });

  try {
    var response = await dio.post(
      "https://deart-13.ru/api/v1/recall?token=bQWc9FDWI3DiEEYYk6lQvHwlAUjTfDrw",
      data: formData,
    );


    final json = response.data;
    if ((response.statusCode == 200) & (json['success'] == true)) {

      print("recall success ${DateTime.now()}");
      return "success";
    } else if (json['reason'] != null) {
      print("recall fail ${DateTime.now()} reason " +
          json["reason"]);
      return json['reason'];
    } else
      return "Неизвестная ошибка";
  } on DioException catch (e) {
    print("recall fail ${DateTime.now()} reason $e");
    if (e.response != null) {
      return e.response.toString();
    } else {
      return e.message.toString();
    }
  }
}


Future booking_room (String roomId,String period,String dateIn,String adult,
    String? timeIn,String? dateOut,String? numHours,
    String name, String phone,String? message) async {
  print("booking_room start ${DateTime.now()}");
  var dio = Dio();
 late FormData formData;
  if(period =="hour") {
     formData = FormData.fromMap({
      'room_id': roomId,
      'period': period,
      //  hour — На час
      //  night — На ночь
      //  day — На сутки
      'date_in': dateIn,
      'time_in': timeIn,
      'num_hours': numHours,
      'adult': adult,
      'name': name,
      'phone': phone,
      'message': message ?? "",
    });
  } else if(period =="night"){   formData = FormData.fromMap({
    'room_id': roomId,
    'period': period,
    //  hour — На час
    //  night — На ночь
    //  day — На сутки
    'date_in': dateIn,
    'adult': adult,
    'name': name,
    'phone': phone,
    'message': message ?? "",
  });}else if(period =="day"){formData=FormData.fromMap(
      { 'room_id': roomId,
        'period': period,
        //  hour — На час
        //  night — На ночь
        //  day — На сутки
        'date_in': dateIn,
        'date_out': dateOut,
        'adult': adult,
        'name': name,
        'phone': phone,
        'message': message ?? "",}
);}
  try {
    var response = await dio.post(
      "https://deart-13.ru/api/v1/booking?token=bQWc9FDWI3DiEEYYk6lQvHwlAUjTfDrw",
      data: formData,
    );


    final json = response.data;
    if ((response.statusCode == 200) & (json['success'] == true)) {

      print("booking_room success ${DateTime.now()}");
      return "success";
    } else if (json['reason'] != null) {
      print("booking_room fail ${DateTime.now()} reason " +
          json["reason"]);
      return json['reason'];
    } else
      return "Неизвестная ошибка";
  } on DioException catch (e) {
    print("booking_room fail ${DateTime.now()} reason $e");
    if (e.response != null) {
      return e.response.toString();
    } else {
      return e.message.toString();
    }
  }
}



Future feedback (String hotelId, String contact,String message) async {
  print("feedback start ${DateTime.now()}");
  var dio = Dio();
  try {
    var response = await dio.post(
      "https://deart-13.ru/api/v1/feedback?token=bQWc9FDWI3DiEEYYk6lQvHwlAUjTfDrw",
      data: {
        'hotel_id': hotelId,
        'contact': contact,
        'message': message,
      },
    );


    final json = response.data;
    if ((response.statusCode == 200) & (json['success'] == true)) {

      print("feedback success ${DateTime.now()}");
      return "success";
    } else if (json['reason'] != null) {
      print("feedback fail ${DateTime.now()} reason " +
          json["reason"]);
      return json['reason'];
    } else
      return "Неизвестная ошибка";
  } on DioException catch (e) {
    print("feedback fail ${DateTime.now()} reason $e");
    if (e.response != null) {
      return e.response.toString();
    } else {
      return e.message.toString();
    }
  }
}

