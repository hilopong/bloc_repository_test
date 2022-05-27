import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc_repository_test/Models/product_model.dart';

import '../../repositories/product/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,  super(ProductLoading());

  @override
  Stream<ProductState> mapEventToState(
      ProductEvent event,
      ) async* {
    if (event is LoadProducts) {
      yield* _mapLoadProductsToState();
    }
    if (event is UpdateProducts) {
      yield* _mapUpdateProductsToState(event);
    }
  }

  Stream<ProductState> _mapLoadProductsToState() async* {
    if (state is ProductLoaded) {
      try {
        yield ProductLoaded(
          products: _productRepository.getAllProducts(),
        );
      } on Exception {
        yield ProductError();
      }
    }

  }

  Stream<ProductState> _mapUpdateProductsToState(
      UpdateProducts event) async* {
    yield ProductLoaded(products: event.products);
  }
}