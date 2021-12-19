import 'package:dio/dio.dart';
import 'package:easyflutter/src/gallery/models/image_item.dart';
import 'package:easyflutter/src/api_chat/models/message.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("")
  Future<List<Message>> getMessages();

  @POST("")
  Future<List<Message>> sendMessage(@Body() Message message);

  @GET("")
  Future<String> getImage();

}
