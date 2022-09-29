import 'package:bloc_listener/add_topic/bloc/add_topic_bloc.dart';
import 'package:bloc_listener/add_topic/bloc/add_topic_event.dart';
import 'package:bloc_listener/add_topic/bloc/add_topic_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTopicPage extends StatelessWidget {
  AddTopicPage({super.key});

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();

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
                return;
              }
              if (state is AddTopicError) {
                ScaffoldMessenger.of(context).showMaterialBanner(
                  MaterialBanner(
                    content: Text(state.error),
                    actions: [
                      IconButton(onPressed: (){
                        ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                      }, icon: const Icon(Icons.close),)
                    ],
                  ),
                );
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Title'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _subtitleController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Subtitle'),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      context.read<AddTopicBloc>().add(
                            AddNewTopic(_titleController.text,
                                _subtitleController.text),
                          );
                    },
                    child: const Text('Add new topic'),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
