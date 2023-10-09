import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components/components.dart';
import '../../shared/cubit/app_cubit.dart';
import '../../shared/cubit/app_states.dart';

class ScienceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,AppStates>(
        builder: (BuildContext context, AppStates state) {
          var list = AppCubit.get(context).science;
          if (list.isNotEmpty) {
            return newsBuilder(list,context);
          } else {
            return  const Center(child: CircularProgressIndicator());
          }
        },
        listener: (BuildContext context, state) {  }
    );

  }

}