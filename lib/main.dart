import 'package:bloc_listener/add_topic/bloc/add_topic_bloc.dart';
import 'package:bloc_listener/topic_list/bloc/topic_bloc.dart';
import 'package:bloc_listener/topic_list/topic_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<TopicBloc>(create: (_) => TopicBloc()),
    BlocProvider<AddTopicBloc>(create: (_) => AddTopicBloc()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TopicListPage(),
    );
  }
}
