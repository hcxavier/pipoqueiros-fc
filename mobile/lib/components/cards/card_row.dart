import 'package:flutter/material.dart';
import 'package:mobile/constants/styles.dart';

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
        boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        color: AppColors.brandYellow, // Amarelo vibrante
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.only(bottom: 3.0), // Espessura da linha
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        decoration: BoxDecoration(
          color: AppColors.bgSecondary, // Cinza escuro / Branco dinâmico
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
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    infoText,
                    style: TextStyle(
                      color: AppColors.textSecondary, // Cinza claro
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