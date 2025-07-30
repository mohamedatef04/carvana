import 'package:carvana/core/services/api_service.dart';
import 'package:carvana/core/services/supabase_auth_service.dart';
import 'package:carvana/features/auth/data/repos/auth_repo_impl.dart';
import 'package:carvana/features/explore/data/repos/expolore_repo_impl.dart';
import 'package:carvana/features/explore/logic/cubits/get_explore_cars/get_explore_cars_cubit.dart';
import 'package:carvana/features/home/data/repos/home_repo_impl.dart';
import 'package:carvana/features/home/logic/cubits/get_cars_for_each_brand/get_cars_for_each_brand_cubit.dart';
import 'package:carvana/features/home/logic/cubits/get_recently_added_cars/get_recently_added_cars_cubit.dart';
import 'package:carvana/features/my%20cars/data/repos/my_cars_repo_impl.dart';
import 'package:carvana/features/my%20cars/logic/cubits/my_uploaded_cars/my_uploaded_cars_cubit.dart';
import 'package:carvana/features/notifications/data/repos/notifications_repo_impl.dart';
import 'package:carvana/features/profile/data/repos/profile_repo_impl.dart';
import 'package:carvana/features/profile/data/repos/user_image_repo_impl.dart';
import 'package:carvana/features/profile/logic/cubits/get_user_data/get_user_data_cubit.dart';
import 'package:carvana/features/search/data/repos/search_repo_impl.dart';
import 'package:carvana/features/sell%20car/data/repos/car_images_repo_impl.dart';
import 'package:carvana/features/sell%20car/data/repos/upload_car_repo_impl.dart';
import 'package:carvana/features/wishlist/data/repos/wishlist_repo_impl.dart';
import 'package:carvana/features/wishlist/logic/cubits/get_favourites/get_favourites_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<SupabaseAuthService>(SupabaseAuthService());
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(getIt.get<SupabaseAuthService>(), getIt.get<ApiService>()),
  );
  getIt.registerLazySingleton<HomeRepoImpl>(
    () => HomeRepoImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerLazySingleton<GetRecentlyAddedCarsCubit>(
    () => GetRecentlyAddedCarsCubit(getIt.get<HomeRepoImpl>()),
  );
  getIt.registerLazySingleton<GetCarsForEachBrandCubit>(
    () => GetCarsForEachBrandCubit(getIt.get<HomeRepoImpl>()),
  );

  getIt.registerLazySingleton<SearchRepoImpl>(
    () => SearchRepoImpl(apiService: getIt.get<ApiService>()),
  );

  getIt.registerLazySingleton<ExpoloreRepoImpl>(
    () => ExpoloreRepoImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerLazySingleton<GetExploreCarsCubit>(
    () => GetExploreCarsCubit(getIt.get<ExpoloreRepoImpl>()),
  );

  getIt.registerLazySingleton<WishlistRepoImpl>(
    () => WishlistRepoImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerLazySingleton<GetFavouritesCubit>(
    () => GetFavouritesCubit(getIt.get<WishlistRepoImpl>()),
  );

  getIt.registerSingleton<SupabaseClient>(Supabase.instance.client);

  getIt.registerSingleton<CarImagesRepoImpl>(
    CarImagesRepoImpl(getIt.get<SupabaseClient>()),
  );

  getIt.registerSingleton<UploadCarRepoImpl>(
    UploadCarRepoImpl(getIt.get<ApiService>()),
  );
  getIt.registerLazySingleton<ProfileRepoImpl>(
    () => ProfileRepoImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerLazySingleton<GetUserDataCubit>(
    () => GetUserDataCubit(getIt.get<ProfileRepoImpl>()),
  );
  getIt.registerLazySingleton<MyCarsRepoImpl>(
    () => MyCarsRepoImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerLazySingleton<MyUploadedCarsCubit>(
    () => MyUploadedCarsCubit(getIt.get<MyCarsRepoImpl>()),
  );

  getIt.registerSingleton<UserImageRepoImpl>(
    UserImageRepoImpl(getIt.get<SupabaseClient>()),
  );

  getIt.registerSingleton<NotificationsRepoImpl>(
    NotificationsRepoImpl(apiService: getIt.get<ApiService>()),
  );
}
