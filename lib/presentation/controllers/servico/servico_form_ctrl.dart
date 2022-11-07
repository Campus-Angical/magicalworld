import 'package:dartz/dartz.dart';
import 'package:magicalworld/data/repositories/servico_repository.dart';
import 'package:magicalworld/domain/failures/failures.dart';
import 'package:magicalworld/domain/servico.dart';

class ServicoFormCtrl {
  ServicoRepository repository = ServicoRepository();

  Future<Either<Failure, String>> submit(
      String imageUrl, String nome, double preco, String descricao) async {
    Servico servico = Servico('', imageUrl, nome, preco, descricao, 0);
    return repository.add(servico);
  }
}
