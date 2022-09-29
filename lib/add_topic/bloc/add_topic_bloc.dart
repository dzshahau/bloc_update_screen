import 'package:bloc_listener/add_topic/bloc/add_topic_event.dart';
import 'package:bloc_listener/add_topic/bloc/add_topic_state.dart';
import 'package:bloc_listener/data/topic_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../data/topic.dart';

class AddTopicBloc extends Bloc<AddTopicEvent, AddTopicState> {
  final TopicRepository _repository = TopicRepository.instance;

  AddTopicBloc() : super(InitialState()) {
    on<AddNewTopic>(_addNewTopic);
  }

  void _addNewTopic(AddNewTopic event, Emitter<AddTopicState> sate) async {
    if (event.title.isEmpty || event.subtitle.isEmpty) {
      return;
    }
    try {
      final result = await _repository
          .addTopic(Topic(title: event.title, subTitle: event.subtitle));
      if (result != 0) {
        emit(NewTopicAdded());
      }
    } catch (e) {
      emit(AddTopicError(e.toString()));
    }
  }
}
