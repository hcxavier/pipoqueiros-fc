import 'package:flutter/material.dart';
import 'package:mobile/constants/styles.dart';

class AvatarStack extends StatelessWidget {
  final List<String> imageUrls;
  final int additionalCount;

  const AvatarStack({
    super.key,
    required this.imageUrls,
    this.additionalCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(
          imageUrls.length,
          (index) => Align(
            widthFactor: 0.7, // o efeito de sobreposição
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.bgSecondary, width: 2),
              ),
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.grey[800],
                backgroundImage: NetworkImage(imageUrls[index]),
              ),
            ),
          ),
        ),
        if (additionalCount > 0)
          Align(
            widthFactor: 0.8,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[800],
                border: Border.all(color: AppColors.bgSecondary, width: 2),
              ),
              child: Text(
                '+$additionalCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        else if (imageUrls.isEmpty && additionalCount == 0)
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[800],
            ),
            child: const Text(
              '0',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
      ],
    );
  }
}
