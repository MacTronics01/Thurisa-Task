import '../../domain/models/categorie_model.dart';
import '../../domain/models/product_model.dart';
import '../../domain/models/single_product.dart';
import '../base/base.vm.dart';

class HomeViewModel extends BaseViewModel {

  int index = 0;
  List<String> imgList = [
    'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  ];
  List<GetCategoriesResponse>? categories;
  GetSingleProductResponse? productResponse;

  Future<List<GetCategoriesResponse>?> getCategories() async {
    try {
      startLoader();
      categories = await userRepository.getCategories();
      stopLoader();
      return categories;
    } catch (error) {
      stopLoader();
    }
  }
  Future<GetSingleProductResponse?> getSingleProducts(int id) async {
    try {
      startLoader();
      productResponse = await userRepository.getSingleProducts(id);
      stopLoader();
      return productResponse;
    } catch (error) {
      stopLoader();
    }
  }

  Future<List<GetProductResponse>?>? getProducts(int id) async {
    try {
      List<GetProductResponse>? product = await userRepository.getProducts(id);
      return product;
    } catch (error) {
      // Handle any error that occurs during the API call
      print('Error fetching products: $error');
      return null;
    }
  }


}