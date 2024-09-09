import 'package:contacts_flutter/features/contacts/models/contact.dart';
import 'package:contacts_flutter/features/contacts/repositories/contacts_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateContactUseCase {
  final ContactsRepository contactsRepository;

  UpdateContactUseCase(this.contactsRepository);

  Future<Either<String, Contact>> invoke(Contact contact) {
    return contactsRepository.editContact(contact);
  }
}
