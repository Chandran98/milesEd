import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milesed/bloc/bloc/dataBloc.dart';
import 'package:milesed/bloc/event/dataEvent.dart';
import 'package:milesed/bloc/state/dataState.dart';

class CheckoutCourse extends StatefulWidget {
  const CheckoutCourse({super.key});

  @override
  State<CheckoutCourse> createState() => _CheckoutCourseState();
}

class _CheckoutCourseState extends State<CheckoutCourse> {

    @override
  void initState() {


    super.initState();
    context.read<DataBloc>().add(GetHomeData());
  }
  @override
  Widget build(BuildContext context) {
    
        BlocProvider.of<DataBloc>(context);

    return Scaffold(body: BlocBuilder<DataBloc, DataState>(
      builder: (context, state) {
        if (state is HomeDataloading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is HomeDataloaded) {
          return ListView.builder(
              itemCount: state.data.data.length,
              itemBuilder: ((context, index) {
                var data = state.data.data[index];
                return ListTile(
                  title: Text(data.name),
                );
              }));
        } else {
          return const SizedBox();
        }
      },
    ));
  }
}