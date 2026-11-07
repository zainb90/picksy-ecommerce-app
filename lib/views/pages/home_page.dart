import 'package:ecommerce_app/utils/theme/app_color.dart';
import 'package:ecommerce_app/view_models/home_cubit/home_cubit.dart';
import 'package:ecommerce_app/views/widgets/category_tab_view.dart';
import 'package:ecommerce_app/views/widgets/home_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context){
        final cubit = HomeCubit ();
        cubit.getHomeData();
        return cubit;
      },
      child: Scaffold(
        backgroundColor: AppColors.whiteBackground,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                            errorListener: (error) {
                              debugPrint("Error loading image: $error");
                            },
                            "https://i.pinimg.com/originals/25/f6/6e/25f66e08ee01e563086bb5723b40ae1b.jpg?nii=t",
                          ),
                          radius: 30,
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi, Lili ",
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Let's go Shopping",
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: AppColors.greyText),
                            ),
                            SizedBox(),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search, size: 30),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.notifications_none_outlined,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TabBar(
                  unselectedLabelColor: AppColors.greyText,
                  labelColor: AppColors.primary,
                  indicatorColor: AppColors.primary,
                  tabs: [
                    Tab(text: "Home"),
                    Tab(text: "Category"),
                  ],
                  controller: _tabController,
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [HomeTabView(), CategoryTabView()],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
