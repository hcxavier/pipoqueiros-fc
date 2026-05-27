import 'package:geolocator/geolocator.dart';

Future<Position> obterLocalizacaoAtual() async {
  bool servicoHabilitado;
  LocationPermission permissao;

  // 1. Testa se os serviços de localização estão habilitados no aparelho.
  servicoHabilitado = await Geolocator.isLocationServiceEnabled();
  if (!servicoHabilitado) {
    // Se não estiver, você pode pedir pro usuário abrir as configurações.
    return Future.error('Os serviços de localização estão desativados.');
  }

  // 2. Checa o status da permissão atual.
  permissao = await Geolocator.checkPermission();
  if (permissao == LocationPermission.denied) {
    permissao = await Geolocator.requestPermission();
    if (permissao == LocationPermission.denied) {
      // O usuário negou a permissão.
      return Future.error('Permissão de localização negada.');
    }
  }

  if (permissao == LocationPermission.deniedForever) {
    // O usuário negou para sempre. O app não pode pedir novamente,
    // ele precisa abrir as configurações do celular.
    return Future.error(
      'As permissões de localização estão permanentemente negadas. Não é possível requisitar permissão.',
    );
  }

  // 3. Se tudo estiver certo, pega a posição atual (Latitude e Longitude)
  return await Geolocator.getCurrentPosition();
}
