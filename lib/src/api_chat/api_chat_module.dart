import 'package:flutter_modular/flutter_modular.dart';

import 'second_api_chat_view.dart';
import 'stores/message_store.dart';

class ApiChatModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => MessageStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => const ApiChatView(title: 'API Chat'),
            transition: TransitionType.fadeIn),
      ];
}
