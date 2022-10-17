import 'package:dartz/dartz.dart';
import 'package:magicalworld/data/repositories/servico_repository.dart';
import 'package:magicalworld/domain/failures/failures.dart';
import 'package:magicalworld/domain/servico.dart';

class ServicoListCtrl {

  ServicoRepository repository = ServicoRepository();

  Future<Either<Failure, List<Servico>>> search (){
    return repository.all();
  }
}