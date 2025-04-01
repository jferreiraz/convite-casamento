import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GiftModal extends StatefulWidget {
  @override
  _GiftModalState createState() => _GiftModalState();
}

class _GiftModalState extends State<GiftModal> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 16, vertical: 20), // Ajuste o padding
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize
              .min, // Garante que o modal ocupe o menor espaço possível
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
              'Instagram da Bella Casa Enxovais e Decorações',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Confira alguns itens interessantes diretamente no Instagram da Bella Casa. Tem várias opções para ajudar a montar o nosso novo lar!',
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () async {
                final url =
                    Uri.parse('https://www.instagram.com/bellacasabella/');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  throw 'Não foi possível abrir o link: $url';
                }
              },
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
              'Nossa lista oficial na Camicado',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Outra opção é a nossa lista na Camicado, onde você pode escolher entre uma grande variedade de itens para o lar.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () async {
                final url = Uri.parse(
                    'https://www.camicado.com.br/lista/convidado/rogeriodinizecarladiniz');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  throw 'Não foi possível abrir o link: $url';
                }
              },
              icon: const Icon(Icons.shopping_cart, color: Colors.white),
              label: const Text(
                'Ir para a Camicado',
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
