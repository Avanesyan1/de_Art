import 'package:de_art/models/Hotel.dart' ;
import 'package:de_art/models/SelectHotelInfo.dart';
import 'package:de_art/models/SelectPageInfo.dart';
import 'package:de_art/models/SelectRoomInfo.dart';

import '../models/AllHotelsInfo.dart';
import '../models/Page.dart' as allPage;
import '../models/Review.dart';

late AllHotel allHotels ;
List<allPage. Page> allPages=[];
List<Review> allReviews=[];
late AllHotelsInfo allHotelsInfo;
late SelectHotelInfo selectHotelInfo;
late SelectPageInfo selectPageInfo;
late SelectRoomInfo selectRoomInfo;
var verify;
String myInfo = '';
String myPhoneVisits = '';
