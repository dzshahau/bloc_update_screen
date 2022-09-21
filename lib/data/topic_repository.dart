import 'package:bloc_listener/data/topic.dart';

class TopicRepository {
  static final TopicRepository _instance = TopicRepository._();

  TopicRepository._();

  static TopicRepository get instance => _instance;

  //final List<Topic> _list = List.empty(growable: true);
  final List<Topic> _list = [Topic("title", "subTitle"), Topic("title1", "subTitle1")];

  List<Topic> get getTopics => _list;

  void addTopic(Topic topic) => _list.add(topic);
}
