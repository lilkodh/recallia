import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class InstallationIdService {
  static const String _storageKey = "recallia_installation_id";
  final _uuid = const Uuid();

  Future<String>? _inisializationFuture;

  Future<String> getInstallationId() async {
    _inisializationFuture ??= _loadOrCreateInstallationId();

    try {
      return await _inisializationFuture!;
    } catch (err) {
      _inisializationFuture = null;
      rethrow;
    }
  }

  Future<String> _loadOrCreateInstallationId() async {
    final prefs = await SharedPreferences.getInstance();
    final existingId = prefs.getString(_storageKey);
    if (existingId != null && existingId.isNotEmpty) {
      return existingId;
    }
    final newId = _uuid.v4();
    await prefs.setString(_storageKey, newId);
    return newId;
  }
}
