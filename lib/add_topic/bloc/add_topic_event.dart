abstract class AddTopicEvent{}

class AddNewTopic extends AddTopicEvent{
  final String title;
  final String subtitle;

  AddNewTopic(this.title, this.subtitle);
}