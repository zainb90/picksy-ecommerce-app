import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/models/product_item_model.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());
  void GetProductDetails(String id) {
    emit(ProductDetailsLoading());
    Future.delayed(Duration(seconds: 1), () {
      final selectedProduct = dummyProducts.firstWhere((item) => item.id == id);
      emit(ProductDetailsLoaded(product: selectedProduct));
    });
  }
}
