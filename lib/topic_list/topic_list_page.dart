import 'package:bloc_listener/add_topic/add_topic_page.dart';
import 'package:bloc_listener/add_topic/bloc/add_topic_bloc.dart';
import 'package:bloc_listener/add_topic/bloc/add_topic_state.dart';
import 'package:bloc_listener/topic_list/bloc/topic_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/topic_event.dart';
import 'bloc/topic_state.dart';

class TopicListPage extends StatelessWidget {
  const TopicListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of topics'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => AddTopicPage(),
            ),
          );
        },
      ),
      body: BlocBuilder<TopicBloc, TopicState>(
        builder: (BuildContext context, state) {
          switch (state.runtimeType) {
            case LoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ListLoaded:
              final topics = (state as ListLoaded).topics;
              return BlocListener<AddTopicBloc, AddTopicState>(
                listener: (_, addTopicState) {
                  if (addTopicState is NewTopicAdded) {
                    context.read<TopicBloc>().add(UpdateList());
                  }
                },
                child: ListView.separated(
                  itemBuilder: (context, index) => Dismissible(
                    confirmDismiss: (direction) async =>
                        direction == DismissDirection.endToStart,
                    onUpdate: (details) {
                      if (details.direction == DismissDirection.startToEnd &&
                          details.reached) {
                      }
                    },
                    onDismissed: (_) {
                      context.read<TopicBloc>().add(DeleteTopic(topics[index]));
                    },
                    secondaryBackground: Container(
                      padding: const EdgeInsets.only(right: 20),
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      child: const Text('Delete'),
                    ),
                    background: Container(
                      padding: const EdgeInsets.only(left: 20),
                      color: Colors.orange,
                      alignment: Alignment.centerLeft,
                      child: const Text('Edit'),
                    ),
                    key: Key(topics[index].title),
                    child: ListTile(
                      title: Text(topics[index].title),
                      subtitle: Text(topics[index].subTitle),
                    ),
                  ),
                  separatorBuilder: (_, __) => const Divider(
                    height: 10,
                  ),
                  itemCount: topics.length,
                ),
              );
          }
          return Placeholder();
        },
      ),
    );
  }
}
