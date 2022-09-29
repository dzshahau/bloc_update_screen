abstract class AddTopicState {}

class InitialState extends AddTopicState {}

class NewTopicAdded extends AddTopicState {}

class AddTopicError extends AddTopicState {
  final String error;

  AddTopicError(this.error);
}
