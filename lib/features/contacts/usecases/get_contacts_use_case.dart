import 'package:contacts_flutter/features/contacts/models/contact.dart';
import 'package:contacts_flutter/features/contacts/repositories/contacts_repository.dart';
import 'package:dartz/dartz.dart';

class GetContactsUseCase {
  final ContactsRepository contactsRepository;

  GetContactsUseCase(this.contactsRepository);

  Future<Either<String, List<Contact>>> invoke() =>
      contactsRepository.getContactsList();
}