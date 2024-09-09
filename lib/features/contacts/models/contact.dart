import 'dart:convert';

Contact contactFromMap(String str) => Contact.fromMap(json.decode(str));

String contactToMap(Contact data) => json.encode(data.toMap());

class Contact {
    int? id;
    String name;
    String email;
    String phone;

    Contact({
        required this.id,
        required this.name,
        required this.email,
        required this.phone,
    });

    factory Contact.fromMap(Map<String, dynamic> json) => Contact(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
    };
}
