import 'package:bloc/bloc.dart';
import 'package:ecommerce_c17_online/features/auth/presentation/bloc/auth_states.dart';
import 'package:ecommerce_c17_online/features/main_layout/favourite/data/models/WishResponse.dart';
import 'package:ecommerce_c17_online/features/main_layout/favourite/domain/usecases/add_product_to_wish_list_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/get_wish_list_use_case.dart';

part 'wish_event.dart';

part 'wish_state.dart';

@injectable
class WishBloc extends Bloc<WishEvent, WishState> {
  AddProductToWishListUseCase addProductToWishListUseCase;

  GetWishListUseCase getWishListUseCase;

  WishBloc(this.addProductToWishListUseCase, this.getWishListUseCase)
    : super(WishState()) {
    on<WishEvent>((event, emit) async {
      if (event is AddProductToWishList) {
        emit(state.copyWith(addProductToWishListStatus: RequestStatus.loading));

        try {
          bool res = await addProductToWishListUseCase.call(event.prodId);

          emit(
            state.copyWith(
              addProductToWishListStatus: RequestStatus.success,
              isAdded: res,
            ),
          );
        } catch (e) {
          emit(
            state.copyWith(addProductToWishListStatus: RequestStatus.failure),
          );
        }
      }
      if (event is GetWishList) {
        emit(state.copyWith(getWishList: RequestStatus.loading));

        try {
          var res = await getWishListUseCase.call();

          emit(
            state.copyWith(getWishList: RequestStatus.success, response: res),
          );
        } catch (e) {
          emit(state.copyWith(getWishList: RequestStatus.failure));
        }
      }
    });
  }
}
