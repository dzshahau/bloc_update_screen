import 'package:bloc_listener/add_topic/bloc/add_topic_event.dart';
import 'package:bloc_listener/add_topic/bloc/add_topic_state.dart';
import 'package:bloc_listener/data/topic_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/topic.dart';

class AddTopicBloc extends Bloc<AddTopicEvent, AddTopicState> {
  final TopicRepository _repository = TopicRepository.instance;

  AddTopicBloc() : super(InitialState()) {
    on<AddNewTopic>((event, state) {
      _repository.addTopic(Topic(event.title, event.subtitle));
      emit(NewTopicAdded());
    });
  }
}
