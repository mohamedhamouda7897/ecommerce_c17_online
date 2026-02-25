import 'package:bloc/bloc.dart';
import 'package:ecommerce_c17_online/features/auth/presentation/bloc/auth_states.dart';
import 'package:ecommerce_c17_online/features/main_layout/home/domain/usecases/get_categories_usecase.dart';
import 'package:ecommerce_c17_online/features/main_layout/home/presentation/bloc/home_events.dart';
import 'package:ecommerce_c17_online/features/main_layout/home/presentation/bloc/home_states.dart';
import 'package:injectable/injectable.dart';
@injectable
class HomeBloc extends Bloc<HomeEvents, HomeState> {
  GetCategoriesUseCase getCategoriesUseCase;

  HomeBloc(this.getCategoriesUseCase) : super(HomeState()) {
    on<GetCategoriesEvent>(_getCategories);
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
