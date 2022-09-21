import 'package:bloc_listener/add_topic/bloc/add_topic_bloc.dart';
import 'package:bloc_listener/add_topic/bloc/add_topic_event.dart';
import 'package:bloc_listener/add_topic/bloc/add_topic_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTopicPage extends StatelessWidget {
  const AddTopicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new topic'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: BlocBuilder<AddTopicBloc, AddTopicState>(
        builder: (context, state) {
          return BlocListener<AddTopicBloc, AddTopicState>(
            listener: (context, state) {
              if (state is NewTopicAdded) {
                Navigator.of(context).pop();
              }
            },
            child: Column(
              children: [
                OutlinedButton(
                  onPressed: () {
                    context
                        .read<AddTopicBloc>()
                        .add(AddNewTopic('new title', 'new subtitle'));
                  },
                  child: const Text('Add new topic'),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
