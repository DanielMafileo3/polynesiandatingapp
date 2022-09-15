import 'package:polymeets/UserInfo/island.dart';

class UsersInfo {
  String? password;
  String? fname;
  String? lname;
  int? number;
  int? age;
  String? gender;
  String? mode; //Dating, BFF, Lazy Meetups
  List<Islands>? nationality; // Can only take 3 nationality
  String? religon;
  List<String>? sports;
  List<String>? movies;
  List<String>? music;
  List<String>? preferedIslands;
  bool? locationEnable;
  bool? notifications;

  String? occupation;
  String? location;
  String? prefernce;

  List<String>? likes;
  List<String>? dislikes;

  UsersInfo(
      String fname,
      String lname,
      String gender,
      int age,
      List<Islands> nash,
      int number,
      String occupation,
      String location,
      String prefernce,
      bool locationEnable,
      bool notificaitons,
      String mode) {
    this.fname = fname;
    this.lname = lname;
    this.gender = gender;
    this.age = age;
    this.nationality = nash;
    this.number = number;
    this.occupation = occupation;
    this.location = location;
    this.prefernce = prefernce;
    this.locationEnable = locationEnable;
    this.notifications = notifications;
    this.mode = mode;
  }
}
