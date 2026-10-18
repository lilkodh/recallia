import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/core/theme/app_text_styles.dart';
import 'package:mobile/features/settings/presentation/widgets/local_device_card.dart';
import 'package:mobile/features/settings/presentation/widgets/cloud_sync_card.dart';
import 'package:mobile/features/settings/presentation/widgets/delete_data_card.dart';
import 'package:mobile/features/settings/presentation/widgets/screen_footer.dart';
import 'package:mobile/features/settings/presentation/widgets/delete_confirmation_dialog.dart';
import 'package:mobile/features/ingestion/application/providers/cloud_sync_preferences_provider.dart';
import 'package:mobile/features/ingestion/application/providers/sync_device_assets_provider.dart';

class PrivacyDataScreen extends ConsumerStatefulWidget {
  const PrivacyDataScreen({super.key});

  @override
  ConsumerState<PrivacyDataScreen> createState() => _PrivacyDataScreenState();
}

class _PrivacyDataScreenState extends ConsumerState<PrivacyDataScreen> {
  bool _isSyncEnabled = false;
  bool _isAppLoading = true;
  bool _isSyncRunning = false;

  @override
  void initState() {
    super.initState();
    _loadPreference();
  }

  Future<void> _loadPreference() async {
    final repository = ref.read(cloudSyncPreferencesProvider);
    final enabled = await repository.isEnabled();
    if (!mounted) return;
    setState(() {
      _isSyncEnabled = enabled;
      _isAppLoading = false;
    });
  }

  Future<void> _toggleSync(bool value) async {
    setState(() => _isSyncEnabled = value);
    await ref.read(cloudSyncPreferencesProvider).setEnabled(value);

    if (value) {
      setState(() => _isSyncRunning = true);
      try {
        await ref.read(syncDeviceAssetsProvider).execute();
      } catch (_) {
      } finally {
        if (mounted) setState(() => _isSyncRunning = false);
      }
    }
  }

  Future<void> _confirmWipeData() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => const DeleteConfirmationDialog(),
    );

    if (confirmed == true && mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Delete action clicked.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isAppLoading) {
      return const Scaffold(
        backgroundColor: Color(0xFFF9F9F9),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const _ScreenHeader(),
              const SizedBox(height: 36),
              const LocalDeviceCard(),
              const SizedBox(height: 24),
              CloudSyncCard(
                isSyncEnabled: _isSyncEnabled,
                isSyncRunning: _isSyncRunning,
                onChanged: _toggleSync,
              ),
              const SizedBox(height: 24),
              DeleteDataCard(onTap: _confirmWipeData),
              const Spacer(),
              const ScreenFooter(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScreenHeader extends StatelessWidget {
  const _ScreenHeader();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppTextStyles.headline.copyWith(
          color: const Color(0xFF1C1C1C),
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
        children: const [
          TextSpan(text: 'Privacy '),
          TextSpan(
            text: '& ',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(text: 'Data'),
        ],
      ),
    );
  }
}