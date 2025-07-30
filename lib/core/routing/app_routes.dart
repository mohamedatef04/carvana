import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/features/auth/ui/views/forget_password_view.dart';
import 'package:carvana/features/auth/ui/views/login_view.dart';
import 'package:carvana/features/auth/ui/views/signup_view.dart';
import 'package:carvana/features/explore/ui/views/explore_view.dart';
import 'package:carvana/features/home/data/models/category_index_model.dart';
import 'package:carvana/features/home/ui/views/all_categories_view.dart';
import 'package:carvana/features/home/ui/views/car_details.dart';
import 'package:carvana/features/home/ui/views/category_view.dart';
import 'package:carvana/features/home/ui/views/home_view.dart';
import 'package:carvana/features/home/ui/views/main_home_view.dart';
import 'package:carvana/features/my%20cars/ui/views/edit_my_car_view.dart';
import 'package:carvana/features/my%20cars/ui/views/my_uploaded_cars_view.dart';
import 'package:carvana/features/notifications/ui/views/notifications_view.dart';
import 'package:carvana/features/onboarding/ui/views/onboarding_view.dart';
import 'package:carvana/features/profile/ui/views/profile_view.dart';
import 'package:carvana/features/search/ui/views/search_view.dart';
import 'package:carvana/features/sell%20car/ui/views/sell_car_view.dart';
import 'package:carvana/features/splash/ui/views/splash_view.dart';
import 'package:carvana/features/wishlist/ui/views/wishlist_view.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashView()),
    GoRoute(
      path: OnboardingView.routeName,
      builder: (context, state) => const OnboardingView(),
    ),
    GoRoute(
      path: LoginView.routeName,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: SignupView.routeName,
      builder: (context, state) => const SignupView(),
    ),
    GoRoute(
      path: ForgetPasswordView.routeName,
      builder: (context, state) => const ForgetPasswordView(),
    ),
    GoRoute(
      path: MainHomeView.routeName,
      builder: (context, state) => const MainHomeView(),
    ),
    GoRoute(
      path: HomeView.routeName,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: CategoryView.routeName,
      builder: (context, state) =>
          CategoryView(categoryIndexModel: state.extra as CategoryIndexModel),
    ),
    GoRoute(
      path: ExploreView.routeName,
      builder: (context, state) => const ExploreView(),
    ),
    GoRoute(
      path: WishlistView.routeName,
      builder: (context, state) => const WishlistView(),
    ),
    GoRoute(
      path: NotificationsView.routeName,
      builder: (context, state) => const NotificationsView(),
    ),
    GoRoute(
      path: SellCarView.routeName,
      builder: (context, state) => const SellCarView(),
    ),
    GoRoute(
      path: ProfileView.routeName,
      builder: (context, state) => const ProfileView(),
    ),
    GoRoute(
      path: SearchView.routeName,
      builder: (context, state) => const SearchView(),
    ),
    GoRoute(
      path: AllCategoriesView.routeName,
      builder: (context, state) => const AllCategoriesView(),
    ),
    GoRoute(
      path: CarDetailsView.routeName,
      builder: (context, state) =>
          CarDetailsView(carModel: state.extra as CarModel),
    ),
    GoRoute(
      path: SellCarView.routeName,
      builder: (context, state) => const SellCarView(),
    ),
    GoRoute(
      path: MyUploadedCarsView.routeName,
      builder: (context, state) => const MyUploadedCarsView(),
    ),
    GoRoute(
      path: EditMyCarView.routeName,
      builder: (context, state) =>
          EditMyCarView(carModel: state.extra as CarModel),
    ),
  ],
);
