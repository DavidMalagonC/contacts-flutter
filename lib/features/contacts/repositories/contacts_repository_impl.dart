import 'dart:convert';
import 'package:contacts_flutter/features/contacts/models/contact.dart';
import 'package:contacts_flutter/features/contacts/repositories/contacts_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class ContactsRepositoryImpl extends ContactsRepository {
  final endpoint = "http://192.168.20.13:8080/contacts";

  @override
  Future<Either<String, bool>> deleteContact(int? id) async {
    final url = Uri.parse('$endpoint/$id');
    final response = await http.delete(url, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      return Right(true);
    } else {
      return Left("Failed to delete contact");
    }
  }

  @override
  Future<Either<String, Contact>> editContact(Contact contact) async {
    final url = Uri.parse('$endpoint/${contact.id}');
    final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'name': contact.name,
        'email': contact.email,
        'phone': contact.phone,
      }),
    );

    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      final updatedContact = Contact.fromMap(jsonMap);
      return Right(updatedContact);
    } else {
      return Left("Failed to update contact");
    }
  }

  @override
  Future<Either<String, List<Contact>>> getContactsList() async {
    final response = await http.get(Uri.parse(endpoint), headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      List<Contact> contactsList = List<Contact>.from(
        jsonList.map((item) => Contact.fromMap(item)),
      );

      return Right(contactsList);
    } else {
      return Left("Failed to load contacts");
    }
  }

  @override
  Future<Either<String, Contact>> saveContact(Contact contact) async {
    final response = await http.post(
      Uri.parse(endpoint),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'name': contact.name,
        'email': contact.email,
        'phone': contact.phone,
      }),
    );

    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      final newContact = Contact.fromMap(jsonMap);
      return Right(newContact);
    } else {
      return Left("Failed to save contact");
    }
  }
}
