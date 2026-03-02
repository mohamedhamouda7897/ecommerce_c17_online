import 'package:bloc/bloc.dart';
import 'package:ecommerce_c17_online/features/auth/presentation/bloc/auth_states.dart';
import 'package:ecommerce_c17_online/features/main_layout/home/domain/usecases/get_categories_usecase.dart';
import 'package:ecommerce_c17_online/features/main_layout/home/presentation/bloc/home_events.dart';
import 'package:ecommerce_c17_online/features/main_layout/home/presentation/bloc/home_states.dart';
import 'package:injectable/injectable.dart';

import '../../../../cart/domain/usecases/get_cart_details.dart';

@injectable
class HomeBloc extends Bloc<HomeEvents, HomeState> {
  GetCategoriesUseCase getCategoriesUseCase;
  GetCartDetailsUseCase getCartDetailsUseCase;

  HomeBloc(this.getCategoriesUseCase, this.getCartDetailsUseCase)
    : super(HomeState()) {
    on<GetCategoriesEvent>(_getCategories);
    on<GetCartDetailsEvent>(_getCartDetails);
  }

  _getCartDetails(GetCartDetailsEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(getCartDetailsStatus: RequestStatus.loading));
    try {
      var result = await getCartDetailsUseCase.call();
      emit(
        state.copyWith(
          getCartDetailsStatus: RequestStatus.success,
          cartResponse: result,
        ),
      );
    } catch (e) {
      emit(state.copyWith(getCartDetailsStatus: RequestStatus.failure));
    }
  }

  _getCategories(GetCategoriesEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(getCategoriesStatus: RequestStatus.loading));

    try {
      var response = await getCategoriesUseCase();
      emit(
        state.copyWith(
          getCategoriesStatus: RequestStatus.success,
          categoryModel: response,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          getCategoriesStatus: RequestStatus.failure,
          getCategoriesErrorMessage: e.toString(),
        ),
      );
    }
  }
}
