
import 'package:dio/dio.dart';
import 'package:thurisa_labs_task/data/remote/user_remote.dart';
import 'package:thurisa_labs_task/domain/models/categorie_model.dart';
import 'package:thurisa_labs_task/domain/models/product_model.dart';
import 'package:thurisa_labs_task/domain/models/single_product.dart';
import '../../locator.dart';
import '../core/config.dart';
import '../core/network/error_handler.dart';
import '../core/network/urlPath.dart';
import '../core/network_config.dart';
import '../services/app_cache.dart';
import '../services/user_services.dart';


/// This calls implements the UserRemote logic
class UserRemoteImpl extends  UserRemote {
  final UserServices userServices;
  AppCache cache = getIt<AppCache>();
  final Dio dio;
  UserRemoteImpl(this.dio, this.userServices,);

  @override
  Future<List<GetCategoriesResponse>?> getCategories() async {
    try {
      Dio _dio = Dio();
      var response = await _dio.get(
        "https://api.escuelajs.co/api/v1/categories",
        options: Options(followRedirects: true, headers: {
          "Accept": "application/json",
        }),
      );

      List<dynamic> responseData = response.data; // Assuming responseData is a list of categories

      List<GetCategoriesResponse> categories = mapResponseToList(responseData);
      print(responseData);
      return categories;
    } on DioError catch (err) {
      handleError(err);
      print("Show login remote error:: $err");
      rethrow;
    }
  }

  List<GetCategoriesResponse> mapResponseToList(List<dynamic> response) {
    return response.map((json) => GetCategoriesResponse.fromJson(json)).toList();
  }

  @override
  Future<List<GetProductResponse>?> getProducts(int id)async {
    try {
      Dio _dio = Dio();
      var response = await _dio.get(
        "https://api.escuelajs.co/api/v1/categories/$id/products",
        options: Options(followRedirects: true, headers: {
          "Accept": "application/json",
        }),
      );

      List<dynamic> responseData = response.data; // Assuming responseData is a list of categories
      List<GetProductResponse> product = mapProductToList(responseData);
      print(responseData);
      return product;
    } on DioError catch (err) {
      handleError(err);
      print("Show login remote error:: $err");
      rethrow;
    }
  }
  List<GetProductResponse> mapProductToList(List<dynamic> response) {
    return response.map((json) => GetProductResponse.fromJson(json)).toList();
  }

  @override
  Future<GetSingleProductResponse?> getSingleProducts(int id) async{
    try {
      Dio _dio = Dio();
      var response =
          await _dio.get("https://api.escuelajs.co/api/v1/products/$id",
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
          }));
      final responseData = GetSingleProductResponse.fromJson(response.data);
      return responseData;
    } on DioError catch (err) {
      handleError(err);
      print("Show login remote error:: $err");
      rethrow;

    }
  }

}
