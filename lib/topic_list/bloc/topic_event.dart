import 'package:bloc_listener/data/topic.dart';

abstract class TopicEvent {}

class UpdateList extends TopicEvent {}

class DeleteTopic extends TopicEvent {
  final Topic topic;

  DeleteTopic(this.topic);
}
