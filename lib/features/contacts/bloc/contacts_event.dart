part of 'contacts_bloc.dart';

@immutable
abstract class ContactsEvent {}

class OnContacts implements ContactsEvent {
  OnContacts();
}

class OnAddContact implements ContactsEvent {
  final String name;
  final String phone;
  final String email;

  OnAddContact({
    required this.name,
    required this.phone,
    required this.email,
  });
}

class OnUpdateContact implements ContactsEvent {
  final int id;
  final String name;
  final String phone;
  final String email;

  OnUpdateContact({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
  });
}

class OnDeleteContact implements ContactsEvent {
  final int? id;

  OnDeleteContact(this.id);
}
