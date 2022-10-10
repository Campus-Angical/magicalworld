import 'package:magicalworld/domain/servico.dart';
import 'package:magicalworld/domain/usuario.dart';

class ServicoDetailCtrl {
  Usuario usuario = Usuario('Luis');

  void like(Servico servico) {
    servico.like++;
    usuario.curtidos.add(servico);
  }

  bool isLiked(Servico servico) {
    for (Servico s in usuario.curtidos) {
      if (servico.id == s.id) {
        return true;
      }
    }
    return false;
  }
}
