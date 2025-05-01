import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planty/core/service/api_service.dart';
import 'package:planty/features/e-commerce/data/models/product_model.dart';

import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  Future<void> fetchProducts() async {
    emit(ProductLoading());
    try {
      await ApiService().setTokenFromPrefs();
      final response = await ApiService().get("/api/admin/dashboard/plants");

      if (response.statusCode == 200) {
        final List<ProductModel> products = (response.data as List)
            .map((item) => ProductModel.fromJson(item))
            .toList();
        emit(ProductLoaded(products));
      } else {
        emit(ProductError("Failed to load products."));
      }
    } catch (e) {
      emit(ProductError("Error: ${e.toString()}"));
    }
  }
}
