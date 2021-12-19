import 'package:flutter_modular/flutter_modular.dart';

import 'first_chat_view.dart';


class ChatModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => const ChatView(title: 'Chat'),
            transition: TransitionType.fadeIn),
      ];
}
