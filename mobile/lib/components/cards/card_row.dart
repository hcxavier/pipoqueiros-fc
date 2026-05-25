import 'package:flutter/material.dart';

class CardRow extends StatelessWidget {
  final String text;
  final String infoText;
  final Widget prefix;
  final Widget suffix; // Corrigido para a grafia correta em inglês

  const CardRow({
    super.key,
    required this.text,
    required this.infoText,
    required this.prefix,
    required this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Fundo amarelo que servirá como a "borda" inferior
      decoration: BoxDecoration(
        color: const Color(0xFFFFD700), // Amarelo vibrante
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.only(bottom: 3.0), // Espessura da linha
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        decoration: BoxDecoration(
          color: const Color(0xFF202024), // Cinza escuro de fundo
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Avatar (Prefixo)
            prefix,
            
            const SizedBox(width: 16.0),
            
            // Textos (Meio)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    infoText,
                    style: const TextStyle(
                      color: Color(0xFFA1A1AA), // Cinza claro
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(width: 16.0),
            
            // Badge (Sufixo)
            suffix,
          ],
        ),
      ),
    );
  }
}