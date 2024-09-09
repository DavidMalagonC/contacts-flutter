part of 'contacts_bloc.dart';

class ContactsState {
  final DataContacs dataContacts;

  ContactsState(
    this.dataContacts,
  );
}

class ContactsStateInitial extends ContactsState {
  ContactsStateInitial()
      : super(
         DataContacs(),
        );
}

class ContactsLoadingState extends ContactsState {
  ContactsLoadingState(super.dataContacts);
}

class ContactsInformationState extends ContactsState {
  ContactsInformationState(super.dataContacts);
}

class ContactsErrorState extends ContactsState {
  ContactsErrorState(super.dataContacts);
}

class DataContacs {

  final List<Contact>? contactList;

  DataContacs({
    this.contactList,
  });

  DataContacs copyWith({
    final List<Contact>? contactList
  }) {
    return DataContacs(
      contactList: contactList ?? this.contactList,
    );
  }
}

