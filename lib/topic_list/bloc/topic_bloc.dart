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
  }

  Future<void> _initState() async {
    await Future.delayed(const Duration(seconds: 10));
    _updateList();
  }

  void _updateList(){
    emit(
      ListLoaded(_repository.getTopics),
    );
  }
}
