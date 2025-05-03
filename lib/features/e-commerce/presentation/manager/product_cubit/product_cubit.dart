import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planty/core/errors/failure.dart';
import 'package:planty/core/service/api_service.dart';
import 'package:planty/features/e-commerce/data/models/product_model.dart';

import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  Future<void> fetchProducts() async {
    emit(ProductLoading());

    try {
      final apiService = ApiService();
      await apiService.setTokenFromPrefs();
      final response = await apiService.get("/api/admin/dashboard/plants");

      if (response.statusCode == 200) {
        final List<ProductModel> products = (response.data as List)
            .map((item) => ProductModel.fromJson(item))
            .toList();
        emit(ProductLoaded(products));
      } else {
        emit(ProductError("Failed to load products."));
      }
    } on DioException catch (dioError) {
      final failure = ServerFailure.fromDioExeption(dioError);
      emit(ProductError(failure.errorMessage));
    } catch (e) {
      emit(ProductError("Unexpected error occurred"));
    }
  }
}
