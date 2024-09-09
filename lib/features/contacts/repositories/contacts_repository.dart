import 'package:contacts_flutter/features/contacts/models/contact.dart';
import 'package:dartz/dartz.dart';

abstract class ContactsRepository {
  Future<Either<String, List<Contact>>> getContactsList();
  Future<Either<String, Contact>> saveContact(Contact contact);
  Future<Either<String, Contact>> editContact(Contact contact);
  Future<Either<String, bool>> deleteContact(int? id);
}