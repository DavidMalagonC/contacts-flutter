import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:contacts_flutter/features/contacts/models/contact.dart';
import 'package:contacts_flutter/features/contacts/usecases/contacts_use_cases.dart';
import 'package:flutter/material.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final ContactsUsesCases usesCases;

  ContactsBloc(this.usesCases) : super(ContactsStateInitial()) {
    on<OnContacts>(onKeyContent);
    on<OnAddContact>(onAddContact);
    on<OnUpdateContact>(onUpdateContact);
    on<OnDeleteContact>(onDeleteContact);
  }

  FutureOr<void> onKeyContent(
    OnContacts event,
    Emitter<ContactsState> emit,
  ) async {
    emit(ContactsLoadingState(state.dataContacts));
    final res = await usesCases.getContactsUseCase.invoke();
    res.fold(
        (l) => emit(ContactsErrorState(
              state.dataContacts,
            )),
        (list) => emit(ContactsInformationState(
              state.dataContacts.copyWith(contactList: list),
            )));
  }

  FutureOr<void> onAddContact(
    OnAddContact event,
    Emitter<ContactsState> emit,
  ) async {
    emit(ContactsLoadingState(state.dataContacts));
    final res = await usesCases.addContactUseCase.invoke(Contact(
      id: null, 
      name: event.name,
      email: event.email,
      phone: event.phone,
    ));
    res.fold(
      (l) => emit(ContactsErrorState(state.dataContacts)),
      (_) => add(OnContacts()),
    );
  }

  FutureOr<void> onUpdateContact(
    OnUpdateContact event,
    Emitter<ContactsState> emit,
  ) async {
    emit(ContactsLoadingState(state.dataContacts));
    final res = await usesCases.updateContactUseCase.invoke(Contact(
      id: event.id,
      name: event.name,
      email: event.email,
      phone: event.phone,
    ));
    res.fold(
      (l) => emit(ContactsErrorState(state.dataContacts)),
      (_) => add(OnContacts()),
    );
  }

  FutureOr<void> onDeleteContact(
    OnDeleteContact event,
    Emitter<ContactsState> emit,
  ) async {
    emit(ContactsLoadingState(state.dataContacts));
    final res = await usesCases.deleteContactUseCase.invoke(event.id);
    res.fold(
      (l) => emit(ContactsErrorState(state.dataContacts)),
      (_) => add(OnContacts()),
    );
  }
}
