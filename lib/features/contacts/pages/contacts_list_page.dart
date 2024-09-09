import 'package:contacts_flutter/data/helpers/texts_helper.dart';
import 'package:contacts_flutter/features/contacts/bloc/contacts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'contact_form.dart';

class ContactsListPage extends StatefulWidget {
  static const String path = '/';

  const ContactsListPage({Key? key}) : super(key: key);

  @override
  State<ContactsListPage> createState() => _ContactsListPageState();
}

class _ContactsListPageState extends State<ContactsListPage> {
  late ContactsBloc _ContactListBloc;

  @override
  void initState() {
    _ContactListBloc = context.read<ContactsBloc>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _ContactListBloc.add(OnContacts());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsBloc, ContactsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(Texts.myContacts)),
          body: SafeArea(
            child: Column(
              children: [
                ContactForm(
                  onSave: (name, phone, email) {
                    _ContactListBloc.add(
                        OnAddContact(name: name, phone: phone, email: email));
                  },
                ),
                Expanded(
                  child: state is ContactsInformationState
                      ? ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.dataContacts.contactList!.length,
                          itemBuilder: (context, index) {
                            final contact =
                                state.dataContacts.contactList![index];
                            return ListTile(
                              leading: Icon(Icons.person),
                              title: Text(contact.name),
                              subtitle: Text(contact.phone),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: ContactForm(
                                              initialName: contact.name,
                                              initialPhone: contact.phone,
                                              initialEmail: contact.email,
                                              onSave: (name, phone, email) {
                                                _ContactListBloc.add(
                                                    OnUpdateContact(
                                                  id: contact
                                                      .id!, // Forzamos el valor no nulo
                                                  name: name,
                                                  phone: phone,
                                                  email: email,
                                                ));
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      _ContactListBloc.add(
                                          OnDeleteContact(contact.id));
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      : Center(child: CircularProgressIndicator()),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
