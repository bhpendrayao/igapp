
import 'package:igapp/models/ig_leader_model.dart';
import 'package:igapp/models/notificationmodel.dart';

import '../Repository/ig_repository.dart';
import '../models/ig_enthu_model.dart';
import '../models/schedule.dart';
import 'package:igapp/models/article_model.dart';
import 'package:igapp/models/imagemodel.dart';

class  IgViewModel{

  final _repo = IgRepository();


  Future<igmodel> fetchIgApi() async{
    final response= await _repo.fetchIgApi();
    return response;
  }
  Future<List<imagemodel>> fetchIgimageApi() async{
    final response= await _repo.fetchIgimageApi();
    return response;
  }
  Future<articlemodel> fetchIgarticleApi() async{
    final response= await _repo.fetchIgarticleApi();
    return response;
  }
  Future<igleadermodel> fetchIgleaderApi() async{
    final response= await _repo.fetchIgleaderApi();
    return response;
  }
  Future<notificationmodel> fetchIgnotificationApi() async{
    final response= await _repo.fetchIgnotificationApi();
    return response;
  }

  Future<schedulemodel> fetchIgscheduleApi(String data) async{
    final response= await _repo.fetchIgscheduleApi(data);
    return response;
  }
}