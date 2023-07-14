
import 'package:thurisa_labs_task/data/repository/user_repository.dart';
import 'package:thurisa_labs_task/domain/models/categorie_model.dart';
import '../../domain/models/product_model.dart';
import '../../domain/models/single_product.dart';
import '../remote/user_remote.dart';
import '../services/user_services.dart';


class UserRepositoryImpl extends UserRepository {
  final UserRemote userRemote;
  final UserServices userServices;
  UserRepositoryImpl(this.userRemote, this.userServices);

  @override
  Future<List<GetCategoriesResponse>?> getCategories() async{
    final response = await userRemote.getCategories();
    return response;

  }
@override
Future<List<GetProductResponse>?> getProducts(int id) async{
    final response = await userRemote.getProducts(id);
    return response;
  }
  @override
  Future<GetSingleProductResponse?> getSingleProducts(int id) async{
    final response = await userRemote.getSingleProducts(id);
    return response;

  }




}


