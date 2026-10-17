import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/connectors/photo_device_connector.dart';

final photoDeviceConnectorProvider = Provider<PhotoDeviceConnector>((ref) {
  return PhotoDeviceConnector();
});
