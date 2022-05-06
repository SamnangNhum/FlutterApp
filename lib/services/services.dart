import '../models/testApi.dart';


abstract class Service {
  Future<List<TestApi>> getTestApi();
}