import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:html' as html; // Apenas para Flutter Web

class GiftModal extends StatefulWidget {
  @override
  _GiftModalState createState() => _GiftModalState();
}

class _GiftModalState extends State<GiftModal> {
  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);

    if (kIsWeb) {
      // Se for Web, abre em uma nova aba
      html.window.open(uri.toString(), '_blank');
    } else {
      // Se for Mobile ou Desktop, abre no aplicativo correspondente
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Não foi possível abrir o link: $url';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Lista de Presentes de Casamento 🎁',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Estamos muito felizes com o seu interesse em nos presentear! Abaixo você encontra os links das nossas listas de presentes. Fique à vontade para escolher o que mais combina conosco! 💖',
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Instagram da XXXX e Decorações',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Confira alguns itens interessantes diretamente no Instagram da XXXXX. Tem várias opções para ajudar a montar o nosso novo lar!',
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => _launchUrl('https://www.instagram.com/'),
              icon: const Icon(Icons.shopping_cart, color: Colors.white),
              label: const Text(
                'Ir para o Instagram',
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
            const SizedBox(height: 20),
            const Text(
              'Nossa lista oficial na XXXXX',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Outra opção é a nossa lista na XXXXXX, onde você pode escolher entre uma grande variedade de itens para o lar.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => _launchUrl(
                  'https://www.bellaenxovais.com.br/?srsltid=AfmBOorm_5DpIZGsKBsez3Z3wT10eCr9vjXT97V4CCuKq_SdSDDlDowC'),
              icon: const Icon(Icons.shopping_cart, color: Colors.white),
              label: const Text(
                'Ir para a XXXX',
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
            const SizedBox(height: 20),
            const Text(
              'Agradecemos o seu carinho e a sua participação nesse momento tão especial para nós! 🎉',
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
