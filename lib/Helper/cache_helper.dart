import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/../generated/locale_keys.g.dart';

class CacheHelper {
  static late SharedPreferences _preferences;

  static init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /////////////////////////////////////////////
  ///
  ///               User Keys
  ///
/////////////////////////////////////////////

  static setUserId(int id) async {
    await _preferences.setInt("user_id", id);
  }

  static int getUserId() {
    return _preferences.getInt("user_id") ?? 0;
  }

  static setFullName(String fullName) async {
    await _preferences.setString("fullname", fullName);
  }

  static String getFullName() {
    return _preferences.getString("fullname") ?? "";
  }

  static setPhone(String phone) async {
    await _preferences.setString("phone", phone);
  }

  static String getPhone() {
    return _preferences.getString("phone") ?? "";
  }

  static setEmail(String email) async {
    await _preferences.setString("email", email);
  }

  static String getEmail() {
    return _preferences.getString("email") ?? "";
  }

  static setuserName(String userName) async {
    await _preferences.setString("userName", userName);
  }

  static String getuserName() {
    return _preferences.getString("userName") ?? "";
  }

  static setuserId(int userId) async {
    await _preferences.setInt("userId", userId);
  }

  static int getuserId() {
    return _preferences.getInt("userId") ?? 0;
  }

  static String getUserType() {
    return _preferences.getString("token_type") ?? "";
  }

  static setUserType(String userType) async {
    await _preferences.setString("token_type", userType);
  }

  static setFCMToken(String token) async {
    await _preferences.setString("access_token", token);
  }

  static String getFCMToken() {
    return _preferences.getString("access_token") ?? "";
  }

/////////////////////////////////////////////
  ///
  ///               User Keys
  ///
/////////////////////////////////////////////

  static setlLang(String token) async {
    await _preferences.setString("lang", token);
  }

  static String getLang() {
    return _preferences.getString("lang") ?? "";
  }

  static Future setIfIsVisitor(bool isVisitor) async {
    await _preferences.setBool("isVisitor", isVisitor);
  }

  static bool getIfIsVisitor() {
    return _preferences.getBool("isVisitor") ?? true;
  }

  // static setIsActive(bool value) async {
  //   await _preferences.setBool("isActive", value);
  // }

  // static bool getIIsActive() {
  //   return _preferences.getBool("isActive") ?? false;
  // }

  // static setCityName(String value) async {
  //   await _preferences.setString(_cityName, value);
  // }

  // static String getCityName() {
  //   return _preferences.getString(_cityName) ?? " ";
  // }

  // static setIfVip(bool value) async {
  //   await _preferences.setBool("isVip", value);
  // }

  // static bool getIfVip() {
  //   return _preferences.getBool("isVip") ?? false;
  // }

  // static setCityId(String value) async {
  //   await _preferences.setString(_cityId, value);
  // }

  // static String getCityId() {
  //   return _preferences.getString(_cityId) ?? " ";
  // }

  // static setUserToken(String token) async {
  //   await _preferences.setString(_userToken, token);
  // }

  // static String getUserToken() {
  //   return _preferences.getString(_userToken) ?? "";
  // }

  // static setLang(lang) async {
  //   await _preferences.setString(_language, lang);
  // }

  // static String getLang() {
  //   return _preferences.getString(_language) ?? "ar";
  // }

  // static setName(String name) async {
  //   await _preferences.setString(_userName, name);
  // }

  // static String getName() {
  //   return _preferences.getString(_userName) ?? "";
  // }

  // static setDefaultLocation(String location) async {
  //   await _preferences.setString(_defaultLocation, location);
  // }

  // static setDefaultLocationId(int id) async {
  //   await _preferences.setInt("DEFAULT_LOCATION_ID", id);
  // }

  // static setDefaultLocationPrice(double price) async {
  //   await _preferences.setDouble("DEFAULT_LOCATION_Price", price);
  // }

  // static double getDefaultLocationPrice() {
  //   return _preferences.getDouble("DEFAULT_LOCATION_Price") ?? 0;
  // }

  // static int? getDefaultLocationId() {
  //   return _preferences.getInt("DEFAULT_LOCATION_ID");
  // }

  // static setCartNumOfItems(int num) async {
  //   await _preferences.setInt("items_num", num);
  // }

  // static updateCartNumOfItems({bool isAdd = true}) async {
  //   await _preferences.setInt("items_num", isAdd ? (getCartNumOfItems() + 1) : (getCartNumOfItems() - 1));
  // }

  // static int getCartNumOfItems() {
  //   return _preferences.getInt("items_num") ?? 0;
  // }

  // static setuserName(String userName) async {
  //   await _preferences.setString(_useruserName, userName);
  // }

  // static String getuserName() {
  //   return _preferences.getString(
  //         _useruserName,
  //       ) ??
  //       "";
  // }

  // static setPhone(String phone) async {
  //   await _preferences.setString(_userPhone, phone);
  // }

  // static String getPhone() {
  //   return _preferences.getString(
  //         _userPhone,
  //       ) ??
  //       "";
  // }

  // static remove() async {
  //   await _preferences.clear();
  // }

  // static removeDefaultLocation() async {
  //   await _preferences.remove("DEFAULT_LOCATION_ID");
  //   await _preferences.remove("DEFAULT_LOCATION");
  // }

  // static removeId() async {
  //   await _preferences.remove(_userId);
  // }

  // static removeUserToken() async {
  //   await _preferences.remove(_userToken);
  // }
  // static removeUserData() async {
  //   await _preferences.remove(_userToken);
  //   await _preferences.remove(_userId);
  //   removeDefaultLocation();
  //   await _preferences.remove(_userToken);
  //   await _preferences.remove(_userToken);
  // }
}
