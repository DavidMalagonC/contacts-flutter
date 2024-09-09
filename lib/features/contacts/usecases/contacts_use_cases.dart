import 'package:contacts_flutter/features/contacts/usecases/get_contacts_use_case.dart';
import 'package:contacts_flutter/features/contacts/usecases/add_contact_use_case.dart';
import 'package:contacts_flutter/features/contacts/usecases/update_contact_use_case.dart';
import 'package:contacts_flutter/features/contacts/usecases/delete_contact_use_case.dart';

class ContactsUsesCases {
  final GetContactsUseCase getContactsUseCase;
  final AddContactUseCase addContactUseCase;
  final UpdateContactUseCase updateContactUseCase;
  final DeleteContactUseCase deleteContactUseCase;

  ContactsUsesCases(
    this.getContactsUseCase,
    this.addContactUseCase,
    this.updateContactUseCase,
    this.deleteContactUseCase,
  );
}
