

import '../../domain/models/categorie_model.dart';
import '../../domain/models/product_model.dart';
import '../../domain/models/single_product.dart';

abstract class UserRemote {

  Future<List<GetCategoriesResponse>?> getCategories();
  Future<List<GetProductResponse>?> getProducts(int id);
  Future<GetSingleProductResponse?> getSingleProducts(int id);


}