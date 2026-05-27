import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:lucide_icons/lucide_icons.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  // Controlador para gerenciar a câmera, flash e direção
  final MobileScannerController cameraController = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates, // Evita ler o mesmo código várias vezes
    facing: CameraFacing.back,
    torchEnabled: false,
  );

  bool _isProcessing = false;

  @override
  void dispose() {
    // É importante descartar o controlador quando a tela for fechada
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ler QR Code'),
        actions: [
          // Botão para ligar/desligar a lanterna
          ValueListenableBuilder(
            valueListenable: cameraController, // Agora escutamos o próprio controlador inteiro
            builder: (context, state, child) {
              // state agora é um MobileScannerState, que contém as informações da câmera
              final isTorchOn = state.torchState == TorchState.on;
              
              return IconButton(
                color: Colors.white,
                icon: Icon(
                  isTorchOn ? LucideIcons.flashlight : LucideIcons.flashlightOff,
                ),
                iconSize: 28.0,
                onPressed: () => cameraController.toggleTorch(),
              );
            },
          ),
          // Botão para inverter a câmera (O ícone não precisa mudar, então fica mais simples!)
          IconButton(
            color: Colors.white,
            icon: const Icon(LucideIcons.switchCamera),
            iconSize: 28.0,
            onPressed: () => cameraController.switchCamera(),
          ),
        ],
      ),
      body: Stack(
        children: [
          // A câmera ocupando a tela toda
          MobileScanner(
            controller: cameraController,
            onDetect: (capture) {
              // Evita processar múltiplas vezes enquanto já está fechando a tela
              if (_isProcessing) return;

              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                if (barcode.rawValue != null) {
                  setState(() {
                    _isProcessing = true;
                  });
                  
                  final String code = barcode.rawValue!;
                  
                  // Retorna o valor lido para a tela anterior e fecha a câmera
                  Navigator.pop(context, code);
                  break;
                }
              }
            },
          ),
          
          // Overlay para guiar o usuário (um quadrado no meio da tela)
          Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.5),
                  width: 3.0,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          
          // Texto de instrução na parte inferior
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Aponte para o QR Code do bolão',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
