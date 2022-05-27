import '../../Models/product_model.dart';

abstract class BaseProductRepository {
  List<Product> getAllProducts();
}