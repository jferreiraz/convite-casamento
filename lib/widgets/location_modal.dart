import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationModal extends StatefulWidget {
  const LocationModal({super.key});

  @override
  _LocationModalState createState() => _LocationModalState();
}

class _LocationModalState extends State<LocationModal> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Ícone para destacar o endereço
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on, size: 28, color: Colors.red), // Ícone
                SizedBox(width: 8), // Espaço entre o ícone e o texto
                Text(
                  'Nosso casamento te espera aqui!',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              '📌 Residencial Yes - Águas Claras\n'
              '🏠 Quadra 210, Lote 08, Brasília - DF\n'
              '📅 Dia 25 de Abril às 13h',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            const Text(
              'Quer conferir o endereço no Google Maps? Basta clicar no botão abaixo e se preparar para um dia inesquecível ao nosso lado!',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: () async {
                final url = Uri.parse(
                    'https://www.google.com/maps/place/Residencial+Yes/@-15.8393962,-48.0417283,17z/data=!4m6!3m5!1s0x935a328a77aa92c5:0xd0e3b44ce8549c07!8m2!3d-15.838746!4d-48.04087!16s%2Fg%2F11b6ns6f6l?entry=ttu&g_ep=EgoyMDI1MDMyNS4xIKXMDSoASAFQAw%3D%3D');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  throw 'Não foi possível abrir o link: $url';
                }
              },
              icon: const Icon(Icons.map, color: Colors.white),
              label: const Text(
                'Abrir no Google Maps',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
