import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';
import 'datasource/network_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  BlocProvider<RecipeBloc>(
        create: (BuildContext context) {
          return RecipeBloc(NetworkService(Dio()));
        },
    child: const MyHomePage(title: 'Flutter Demo Home Page'),
    )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final service = NetworkService(Dio());

  late RecipeBloc recipeBloc;


@override
  void initState() {
    super.initState();
    recipeBloc = BlocProvider.of<RecipeBloc>(context);

}

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.


    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: BlocBuilder<RecipeBloc, SearchState>(builder: (context, state) {
        if (state is RecipeInitialState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is RecipeIsLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is RecipeLoadedState) {
          return Center(child: Text("${state.recipesList}"),);
        } else {
          return const Center(child: Text("sssssss"),);
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          recipeBloc.add(RecipeSearchEvent("query", 1));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}