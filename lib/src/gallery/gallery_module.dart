import 'screens/image_detail.dart';
import 'stores/image_store.dart';
import 'third_gallery_view.dart';
import 'stores/gallery_settings_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GalleryModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => GallerySettingsStore()),
        Bind.singleton((i) => ImageStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => const GalleryView(title: 'Gallery'),
            transition: TransitionType.fadeIn),
        ChildRoute('/detail',
            child: (context, args) => ImageDetailPage(image: args.data),
            transition: TransitionType.fadeIn),
      ];
}
