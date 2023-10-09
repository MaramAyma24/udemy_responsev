import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components/components.dart';
import '../../shared/cubit/app_cubit.dart';
import '../../shared/cubit/app_states.dart';

class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      builder: (BuildContext context, state) {
        var list =AppCubit.get(context).search;
        return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: searchController ,
                validator: (String? value) {
                  if (value!.isEmpty)
                  {return'search must not be empty';}
                  else {return null;}
                }  ,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search_rounded),
                  label: Text ('search'),
                ),
                keyboardType: TextInputType.text,
                onChanged: (value){
                  AppCubit.get(context).getSearch(value);
                },
              ),
            ),
            const SizedBox(height: 5,),
            Expanded(child: newsBuilder(context,list)),
          ],
        ),
      ); },
     listener: (BuildContext context, state) {  },);
  }

}