import 'package:bloc_listener/data/topic_repository.dart';
import 'package:bloc_listener/topic_list/bloc/topic_event.dart';
import 'package:bloc_listener/topic_list/bloc/topic_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopicBloc extends Bloc<TopicEvent, TopicState> {
  final TopicRepository _repository = TopicRepository.instance;

  TopicBloc() : super(LoadingState()) {
    _initState();
    on<UpdateList>((event, state) async {
      _updateList();
    });
    on<DeleteTopic>(_deleteTopic);
  }

  Future<void> _initState() async {
    //await Future.delayed(const Duration(seconds: 10));
    _updateList();
  }

  void _updateList() async {
    emit(
      ListLoaded(await _repository.getTopics),
    );
  }

  void _deleteTopic(DeleteTopic event, Emitter<TopicState> state) async {
    if (await _repository.deleteTopic(event.topic) != 0) {
      _updateList();
    }
  }
}
