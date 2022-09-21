import '../../data/topic.dart';

abstract class TopicState {}

class LoadingState extends TopicState {}

class ListLoaded extends TopicState {
  final List<Topic> topics;

  ListLoaded(this.topics);
}
