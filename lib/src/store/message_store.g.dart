// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MessageStore on _MessageStore, Store {
  Computed<ObservableList<Message>>? _$fetchedComputed;

  @override
  ObservableList<Message> get fetched => (_$fetchedComputed ??=
          Computed<ObservableList<Message>>(() => super.fetched,
              name: '_MessageStore.fetched'))
      .value;

  final _$messagesAtom = Atom(name: '_MessageStore.messages');

  @override
  ObservableList<Message>? get messages {
    _$messagesAtom.reportRead();
    return super.messages;
  }

  @override
  set messages(ObservableList<Message>? value) {
    _$messagesAtom.reportWrite(value, super.messages, () {
      super.messages = value;
    });
  }

  final _$_MessageStoreActionController =
      ActionController(name: '_MessageStore');

  @override
  void fetchMessages() {
    final _$actionInfo = _$_MessageStoreActionController.startAction(
        name: '_MessageStore.fetchMessages');
    try {
      return super.fetchMessages();
    } finally {
      _$_MessageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addMessage(String message) {
    final _$actionInfo = _$_MessageStoreActionController.startAction(
        name: '_MessageStore.addMessage');
    try {
      return super.addMessage(message);
    } finally {
      _$_MessageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
messages: ${messages},
fetched: ${fetched}
    ''';
  }
}
