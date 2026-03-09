part of 'wish_bloc.dart';

abstract class WishEvent extends Equatable {
  const WishEvent();
}

class GetWishList extends WishEvent {
  const GetWishList();

  @override
  List<Object?> get props => [];
}

class AddProductToWishList extends WishEvent {
  final String prodId;

  const AddProductToWishList(this.prodId);

  @override
  List<Object?> get props => [prodId];
}
