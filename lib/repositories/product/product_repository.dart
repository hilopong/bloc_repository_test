import '../../Models/product_model.dart';
import 'base_product_repository.dart';

class ProductRepository extends BaseProductRepository {

  @override
  List<Product> getAllProducts() {
    return Product.products;
    }

}