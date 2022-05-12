import '../models/testApi.dart';

abstract class Service {
  Future<List<AllPostApi>> getTestApi();


  // Get Post By Category Id
  Future<List<CatApi>> getTestCatApi(id);
}
