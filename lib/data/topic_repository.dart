import 'package:bloc_listener/data/database_helper.dart';
import 'package:bloc_listener/data/topic.dart';

class TopicRepository {
  static final TopicRepository _instance = TopicRepository._();

  TopicRepository._();

  static TopicRepository get instance => _instance;

  Future<List<Topic>> get getTopics async {
    final db = DatabaseHelper.instance;
    final result = await db.getTopics();
    return result.map((e) => Topic.fromJson(e)).toList();
  }

  Future<int> addTopic(Topic topic) async {
    final db = DatabaseHelper.instance;
    return db.addTopic(topic);
  }

  Future<int> deleteTopic(Topic topic) async {
    return DatabaseHelper.instance.deleteTopic(topic.id!);
  }
}
