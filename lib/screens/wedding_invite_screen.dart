import 'package:flutter/material.dart';
import '../widgets/confirmation_modal.dart';

class WeddingInviteScreen extends StatelessWidget {
  const WeddingInviteScreen({super.key});

  void _openConfirmationModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => ConfirmationModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => _openConfirmationModal(context),
              child: const Text(
                'Confirmar Presença',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
