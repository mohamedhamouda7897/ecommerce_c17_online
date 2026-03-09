part of 'wish_bloc.dart';

class WishState extends Equatable {
  RequestStatus? addProductToWishListStatus;
  bool? isAdded;
  RequestStatus? getWishList;
  WishResponse? response;

  WishState({
    this.addProductToWishListStatus = RequestStatus.init,
    this.isAdded,
    this.getWishList,
    this.response,

  });

  WishState copyWith({
    RequestStatus? addProductToWishListStatus,
    bool? isAdded,
    RequestStatus? getWishList,
    WishResponse? response,
  }) {
    return WishState(
      addProductToWishListStatus:
          addProductToWishListStatus ?? this.addProductToWishListStatus,
      isAdded: isAdded ?? this.isAdded,
      getWishList: getWishList ?? this.getWishList,
      response: response ?? this.response,

    );
  }

  @override
  List<Object?> get props => [isAdded,response,getWishList,addProductToWishListStatus];
}