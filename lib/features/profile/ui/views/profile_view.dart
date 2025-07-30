import 'package:carvana/core/services/get_it_service.dart';
import 'package:carvana/features/profile/data/repos/profile_repo_impl.dart';
import 'package:carvana/features/profile/data/repos/user_image_repo_impl.dart';
import 'package:carvana/features/profile/logic/cubits/get_user_data/get_user_data_cubit.dart';
import 'package:carvana/features/profile/logic/cubits/pass_user_image_url/pass_user_image_url_cubit.dart';
import 'package:carvana/features/profile/logic/cubits/user_image/user_image_cubit.dart';
import 'package:carvana/features/profile/ui/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const routeName = '/profile-view';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt.get<GetUserDataCubit>()),
        BlocProvider(
          create: (context) => UserImageCubit(getIt.get<UserImageRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              PassUserImageUrlCubit(getIt.get<ProfileRepoImpl>()),
        ),
      ],

      child: const Scaffold(body: ProfileViewBody()),
    );
  }
}
