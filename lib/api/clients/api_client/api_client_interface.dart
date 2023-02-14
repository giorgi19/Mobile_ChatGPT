import 'package:mobile_chatgpt/api/api.dart';

abstract class ApiClientInterface {
  const ApiClientInterface();
  Future<String?> getData({
    required String id,
    int? limit,
    int? offset,
    bool preview = false,
  });
  Future<List<ModelsModel>> getModels();

  Future<List<ChatModel>> sendMessage({required String message, required String modelId});
}
