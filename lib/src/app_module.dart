import 'package:flutter_modular/flutter_modular.dart';

import 'api_chat/api_chat_module.dart';
import 'chat/chat_module.dart';
import 'gallery/gallery_module.dart';
import 'instagram/instagram_module.dart';
import 'menu/item_list_view.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const ItemListView()),
        ModuleRoute('/homework/1/', module: ChatModule()),
        ModuleRoute('/homework/2/', module: ApiChatModule()),
        ModuleRoute('/homework/3/', module: GalleryModule()),
        ModuleRoute('/homework/4/', module: InstagramModule()),
      ];
}
