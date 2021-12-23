import 'screens/post_create.dart';
import 'instagram_view.dart';
import 'stores/image_store.dart';
import 'stores/gallery_settings_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InstagramModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => GallerySettingsStore()),
        Bind.singleton((i) => ImageStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => const InstagramView(title: 'easygram'),
            transition: TransitionType.fadeIn),
        ChildRoute('/create', child: (context, args) => const PostCreate())
      ];
}
