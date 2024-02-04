import 'package:igapp/models/ig_leader_model.dart';
import 'package:igapp/models/notificationmodel.dart';

import '../Repository/ig_repository.dart';
import '../models/ig_enthu_model.dart';
import '../models/schedule.dart';
import 'package:igapp/models/article_model.dart';
import 'package:igapp/models/imagemodel.dart';

class IgViewModel {
  final _repo = IgRepository();

  Future<igmodel> fetchIgApi() async {
    final response = await _repo.fetchIgApi();
    return response;
  }

  Future<List<imagemodel>> fetchIgimageApi(String date) async {
    final response = await _repo.fetchIgimageApi(date);
    return response;
  }

  Future<articlemodel> fetchIgarticleApi(String date) async {
    final response = await _repo.fetchIgarticleApi(date);
    return response;
  }

  Future<igleadermodel> fetchIgleaderApi() async {
    final response = await _repo.fetchIgleaderApi();
    return response;
  }

  Future<notificationmodel> fetchIgnotificationApi() async {
    final response = await _repo.fetchIgnotificationApi();
    return response;
  }

  Future<schedulemodel> fetchIgscheduleApi(String data) async {
    final response = await _repo.fetchIgscheduleApi(data);
    return response;
  }
  Future<schedulemodel> fetchIgsheduleApi(String data,String dept) async {
    final response = await _repo.fetchIgsheduleApi(data,dept);
    return response;
  }
}
