import 'package:bloc/bloc.dart';
import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/features/wishlist/logic/repos/wishlist_repo.dart';
import 'package:meta/meta.dart';

part 'get_favourites_state.dart';

class GetFavouritesCubit extends Cubit<GetFavouritesState> {
  GetFavouritesCubit(this.wishlistRepo) : super(GetFavouritesInitial());

  final WishlistRepo wishlistRepo;

  Future<void> getFavList() async {
    if (state is GetFavouritesLoadingState) return;
    emit(GetFavouritesLoadingState());

    final res = await wishlistRepo.getWishlistCars();

    res.fold((l) => emit(GetFavouritesErrorState(l.errorMessage)), (r) {
      if (r.isEmpty) {
        emit(GetFavouritesEmptyState());
      } else {
        emit(GetFavouritesSuccessState(favList: r));
      }
    });
  }

  Future<void> removeFav({required String carId}) async {
    final res = await wishlistRepo.removeFromWishlist(carId: carId);

    res.fold((l) => emit(GetFavouritesErrorState(l.errorMessage)), (r) async {
      emit(RemovedFavSuccessState());
      final res = await wishlistRepo.getWishlistCars();
      res.fold((l) => emit(GetFavouritesErrorState(l.errorMessage)), (r) {
        if (r.isEmpty) {
          emit(GetFavouritesEmptyState());
        } else {
          emit(GetFavouritesSuccessState(favList: r));
        }
      });
    });
  }
}
