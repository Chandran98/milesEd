import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milesed/bloc/bloc/dataBloc.dart';
import 'package:milesed/bloc/event/dataEvent.dart';
import 'package:milesed/bloc/state/dataState.dart';
import 'package:milesed/pages/secondpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<DataBloc>().add(GetTestimonialData());
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DataBloc>(context);

    return Scaffold(
        appBar: AppBar(
            leading: InkWell(
          child: Container(
            height: 50,
            width: 100,
            color: Colors.red,
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SecondPage()));
          },
        )),
        body: BlocBuilder<DataBloc, DataState>(
          builder: (context, state) {
            if (state is TestimonialDataloading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is TestimonialDataloaded) {
              return ListView.builder(
                  itemCount: state.data.data.length,
                  itemBuilder: ((context, index) {
                    var data = state.data.data[index];
                    return ListTile(
                      title: Text(data.firstName),
                    );
                  }));
            } else {
              return const SizedBox();
            }
          },
        ));
  }
}
