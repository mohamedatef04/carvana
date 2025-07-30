import 'package:carvana/core/widgets/custom_app_bar.dart';
import 'package:carvana/features/auth/ui/widgets/custom_text_form_field.dart';
import 'package:carvana/features/search/logic/cubits/get_all_cars_list_cubit.dart';
import 'package:carvana/features/search/ui/widgets/search_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Search',
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop(true);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: CustomTextFormField(
                    hintText: 'Search',
                    onChanged: (value) {
                      context.read<GetSearchedCarsListCubit>().getAllCarsList(
                        carName: value,
                      );
                    },
                  ),
                ),
                const SearchListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
