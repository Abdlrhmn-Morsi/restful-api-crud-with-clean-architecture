import 'package:dio/dio.dart';

abstract class WebServices {
  Dio dio;
  WebServices({
    required this.dio,
  });

  Future<Response> readData();
  Future<Response> updateData({data, int? id});
  Future<Response> deleteData(int id);
  Future<Response> createData({data});
}

class WebServicesImp implements WebServices {
  @override
  Dio dio;
  WebServicesImp({
    required this.dio,
  });

  @override
  Future<Response> readData() async {
    return await dio.get('posts');
  }

  @override
  Future<Response> createData({data})async {
    dio.options.headers['Content-type'] = 'application/json; charset=UTF-8';
    return await dio.post('posts', data: data);
  }

  @override
  Future<Response> deleteData(int id) async {
    return await dio.delete('posts/$id');
  }

  @override
  Future<Response> updateData({data, int? id}) async {
    dio.options.headers['Content-type'] = 'application/json; charset=UTF-8';
    return await dio.patch('posts/$id', data: data);
  }
}
