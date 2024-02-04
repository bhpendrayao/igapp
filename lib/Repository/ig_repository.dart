import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:igapp/models/article_model.dart';
import 'package:igapp/models/ig_leader_model.dart';
import 'package:igapp/models/notificationmodel.dart';
import 'package:igapp/models/schedule.dart';

import '../models/ig_enthu_model.dart';
import 'package:igapp/models/imagemodel.dart';

class IgRepository {
  Future<igmodel> fetchIgApi() async {
    String url =
        'https://campaverse-production.up.railway.app/api/v1/enthu_points';
    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return igmodel.fromJson(body);
    } else {
      throw Exception("Error");
    }
  }

  Future<igleadermodel> fetchIgleaderApi() async {
    String url =
        'https://campaverse-production.up.railway.app/api/v1/leaderboard_points';
    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return igleadermodel.fromJson(body);
    } else {
      throw Exception("Error");
    }
  }

  Future<schedulemodel> fetchIgscheduleApi(String date) async {
    String url =
        'https://campaverse-production.up.railway.app/api/v1/schedules/${date}';
    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return schedulemodel.fromJson(body);
    } else {
      throw Exception("Error");
    }
  }
  Future<schedulemodel> fetchIgsheduleApi(String date,String dept) async {
    String url =
        'https://campaverse-production.up.railway.app/api/v1/schedules/${date}/${dept}';
    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return schedulemodel.fromJson(body);
    } else {
      throw Exception("Error");
    }
  }

  Future<articlemodel> fetchIgarticleApi(String date) async {
    String url = 'https://campaverse-production.up.railway.app/api/v1/articles/${date}';
    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return articlemodel.fromJson(body);
    } else {
      throw Exception("Error");
    }
  }

  Future<List<imagemodel>> fetchIgimageApi(String date) async {
    String url = 'https://campaverse-production.up.railway.app/api/v1/images/${date}';
    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body);
      final List<imagemodel> images =
          body.map((item) => imagemodel.fromJson(item)).toList();
      return images;
    } else {
      throw Exception("Error");
    }
  }

  Future<notificationmodel> fetchIgnotificationApi() async {
    String url =
        'https://campaverse-production.up.railway.app/api/v1/notification';
    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return notificationmodel.fromJson(body);
    } else {
      throw Exception("Error");
    }
  }
}
