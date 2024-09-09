import 'package:contacts_flutter/features/contacts/repositories/contacts_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteContactUseCase {
  final ContactsRepository contactsRepository;

  DeleteContactUseCase(this.contactsRepository);

  Future<Either<String, bool>> invoke(int? id) {
    return contactsRepository.deleteContact(id);
  }
}
