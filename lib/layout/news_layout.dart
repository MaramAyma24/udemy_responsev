import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/serch/search_screen.dart';
import 'package:news/shared/components/components.dart';
import '../shared/cubit/app_cubit.dart';
import '../shared/cubit/app_states.dart';


class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (BuildContext context, state) {
        var cubit = AppCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title:  const Text('NEWS'),
            actions: [
              IconButton(
                  onPressed: () {
                    navigateTo(context, SearchScreen());
                  }, icon: const Icon(Icons.search_rounded)),
              IconButton(
                  onPressed: () {
                //    context.read<AppCubit>().changeAppTheme();

                    AppCubit.get(context).changeAppTheme();
                  },
                  icon: const Icon(Icons.brightness_4),),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.botItems,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBotNavBar(index);
            },
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
