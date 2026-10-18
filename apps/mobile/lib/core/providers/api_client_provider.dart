import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../network/api_client.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(baseUrl:  'http://192.168.170.203:3001');
});
