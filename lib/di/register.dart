import 'package:contacts_flutter/features/contacts/bloc/contacts_bloc.dart';
import 'package:contacts_flutter/features/contacts/repositories/contacts_repository.dart';
import 'package:contacts_flutter/features/contacts/repositories/contacts_repository_impl.dart';
import 'package:contacts_flutter/features/contacts/usecases/contacts_use_cases.dart';
import 'package:contacts_flutter/features/contacts/usecases/get_contacts_use_case.dart';
import 'package:contacts_flutter/features/contacts/usecases/add_contact_use_case.dart';
import 'package:contacts_flutter/features/contacts/usecases/update_contact_use_case.dart';
import 'package:contacts_flutter/features/contacts/usecases/delete_contact_use_case.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class DependencyInjection {
  ContactsRepository contacsRepository = ContactsRepositoryImpl();

  Future<void> register() async {
    _registerContacts();
  }

  void _registerContacts() {
    getIt.registerLazySingleton(() => ContactsBloc(
          ContactsUsesCases(
            GetContactsUseCase(contacsRepository),
            AddContactUseCase(contacsRepository),
            UpdateContactUseCase(contacsRepository),
            DeleteContactUseCase(contacsRepository),
          ),
        ));
  }
}
