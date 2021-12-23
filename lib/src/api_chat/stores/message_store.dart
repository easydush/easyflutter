import 'package:dio/dio.dart';
import 'package:easyflutter/src/api/api_client.dart';
import 'package:easyflutter/src/api_chat/models/message.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'message_store.g.dart';

// This is the class used by rest of your codebase
class MessageStore = _MessageStore with _$MessageStore;

// The store-class
abstract class _MessageStore with Store {
  final String author_name = "easydush";
  @observable
  ObservableList<Message>? messages = ObservableList.of([]);

  RestClient restClient = RestClient(Dio());

  @action
  void fetchMessages() {
    restClient.getMessages().then((List<Message> fetchedMessages) {
      List<Message> msgs = fetchedMessages;
      msgs.forEach((message) => message.mine = message.author == author_name);
      messages = ObservableList.of(msgs);
    }).catchError((error) {
      print(error.toString());
    });
  }

  @action
  void addMessage(String message) {
    restClient.sendMessage(Message(author: author_name, message: message))
        .whenComplete(() => fetchMessages());
  }

  @computed
  ObservableList<Message> get fetched =>
      ObservableList.of(messages?.reversed.toList() ?? []);
}
