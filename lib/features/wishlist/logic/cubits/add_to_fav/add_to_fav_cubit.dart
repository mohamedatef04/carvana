import 'package:bloc/bloc.dart';
import 'package:carvana/features/wishlist/logic/repos/wishlist_repo.dart';
import 'package:meta/meta.dart';

part 'add_to_fav_state.dart';

class AddToFavCubit extends Cubit<AddToFavState> {
  AddToFavCubit(this.wishlistRepo) : super(AddToFavInitial());

  final WishlistRepo wishlistRepo;

  Future<void> addToFav({required String carId}) async {
    try {
      await wishlistRepo.addToWishlist(carId: carId);
      emit(AddToFavSuccess());
    } catch (e) {
      emit(AddToFavFailure(errorMessage: e.toString()));
    }
  }
}
