import 'package:magicalworld/domain/servico.dart';
import 'package:magicalworld/domain/usuario.dart';
import 'package:magicalworld/presentation/services/auth_service.dart';

class ServicoDetailCtrl {

  void like(Servico servico) {
    servico.like++;
    AuthService.usuario.favoritos.add(servico.id);
  }

  bool isLiked(Servico servico) {
    for (String s in AuthService.usuario.favoritos) {
      if (servico.id == s) {
        return true;
      }
    }
    return false;
  }
}
