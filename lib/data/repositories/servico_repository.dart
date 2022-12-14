import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_streaming.dart';
import 'package:flutter/cupertino.dart';
import 'package:magicalworld/domain/failures/failures.dart';
import 'package:magicalworld/domain/servico.dart';
import 'package:magicalworld/domain/usuario.dart';

class ServicoRepository {
  Future<Either<Failure, List<Servico>>> all() {
    return FirebaseFirestore.instance
        .collection('servicos')
        .get()
        .then((snapshot) {
      List<Servico> servicos = [];
      for (QueryDocumentSnapshot doc in snapshot.docs) {
        final json = doc.data() as Map<String, dynamic>;
        json['id'] = doc.id;
        Servico s = Servico(
            json['id'],
            json['imagem'],
            json['nome'],
            double.parse(json['preco'].toString()),
            json['descricao'],
            json['likes']);
        servicos.add(s);
      }
      return right<Failure, List<Servico>>(servicos);
    }).catchError((error) {
      return left<Failure, List<Servico>>(Failure('Erro ao buscar no BD'));
    });
  }

  Future<Either<Failure, String>> add(Servico servico) {
    return FirebaseFirestore.instance.collection('servicos').add({
      'nome': servico.nome,
      'descricao': servico.descricao,
      'imagem': servico.imageUrl,
      'preco': servico.preco,
      'likes': servico.like,
    }).then((value) {
      return right<Failure, String>('');
    }).catchError((error) {
      return left<Failure, String>(Failure('Erro ao buscar no BD'));
    });
  }

  
Future<Either<Failure, List<Servico>>> favoritos(Usuario usuario) async {
    if (usuario.favoritos.isEmpty) {
      return right([]);
    }

    return FirebaseFirestore.instance
        .collection('servicos')
        .where(FieldPath.documentId, whereIn: usuario.favoritos)
        .get()
        .then((snapshot) {
      List<Servico> servicos = [];
      for (QueryDocumentSnapshot doc in snapshot.docs) {
        final json = doc.data() as Map<String, dynamic>;
        json['id'] = doc.id;
        Servico s = Servico(
            json['id'],
            json['imagem'],
            json['nome'],
            double.parse(json['preco'].toString()),
            json['descricao'],
            json['likes']);
        servicos.add(s);
      }
      return right<Failure, List<Servico>>(servicos);
    }).catchError((error) {
      return left<Failure, List<Servico>>(Failure('Erro ao buscar no BD'));
    });
  }

}
