import 'package:flutter/foundation.dart' show kIsWeb;
// import 'dart:io' show Platform;
import 'dart:html' as html;
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
              '📌 Residencial XXXX - XXXXX XXXXXX\n'
              '🏠 Quadra XXXXX, Lote XXXX, Brasília - DF\n'
              '📅 Dia XX de XXXXX às XXXh',
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
                    'https://www.google.com/maps/place/Rodovi%C3%A1ria+de+Bras%C3%ADlia/@-15.7950005,-47.8922803,15z/data=!4m10!1m2!2m1!1srodoviaria+bsb!3m6!1s0x935a3b1d7f4418f3:0x50555a7d3fcdcb31!8m2!3d-15.7940086!4d-47.8825325!15sCg5yb2RvdmlhcmlhIGJzYpIBEHRydWNraW5nX2NvbXBhbnngAQA!16s%2Fg%2F11fy42j38b?entry=ttu&g_ep=EgoyMDI1MDMzMC4wIKXMDSoASAFQAw%3D%3D');

                if (kIsWeb) {
                  // Se for Flutter Web, abre em uma nova aba
                  html.window.open(url.toString(), '_blank');
                } else {
                  // Se não for Web, tenta abrir no app externo
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  } else {
                    throw 'Não foi possível abrir o link: $url';
                  }
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
