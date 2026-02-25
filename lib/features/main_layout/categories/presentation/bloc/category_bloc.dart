import 'package:bloc/bloc.dart';
import 'package:ecommerce_c17_online/features/auth/presentation/bloc/auth_states.dart';
import 'package:ecommerce_c17_online/features/main_layout/categories/domain/usecases/get_sub_category_usecasse.dart';
import 'package:ecommerce_c17_online/features/main_layout/categories/presentation/bloc/category_events.dart';
import 'package:ecommerce_c17_online/features/main_layout/categories/presentation/bloc/category_states.dart';
import 'package:ecommerce_c17_online/features/main_layout/home/domain/usecases/get_categories_usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoryBloc extends Bloc<CategoryEvents, CategoryState> {
  GetCategoriesUseCase getCategoriesUseCase;
  GetSubCategoryUseCasse getSubCategoryUseCasse;

  CategoryBloc(this.getCategoriesUseCase, this.getSubCategoryUseCasse)
    : super(CategoryState()) {
    on<GetCategoriesEvent>(_getCategories);
    on<ChangeSelectedIndex>(_changeSelectedIndex);
    on<GetSubCategoriesEvent>(_getSubCategories);
  }

  _changeSelectedIndex(ChangeSelectedIndex event, Emitter<CategoryState> emit) {
    emit(state.copyWith(selectedIndex: event.index));
  }

  _getSubCategories(
    GetSubCategoriesEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(state.copyWith(getSubCategoriesStatus: RequestStatus.loading));

    try {
      var response = await getSubCategoryUseCasse();
      emit(
        state.copyWith(
          getSubCategoriesStatus: RequestStatus.success,
          subCategoryModel: response,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          getSubCategoriesStatus: RequestStatus.failure,
          getSubCategoriesErrorMessage: e.toString(),
        ),
      );
    }
  }

  _getCategories(GetCategoriesEvent event, Emitter<CategoryState> emit) async {
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
