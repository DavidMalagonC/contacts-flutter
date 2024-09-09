import 'package:contacts_flutter/di/register.dart';
import 'package:contacts_flutter/features/contacts/bloc/contacts_bloc.dart';
import 'package:contacts_flutter/features/contacts/pages/contacts_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await DependencyInjection().register();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [BlocProvider<ContactsBloc>(
            create: (_) => getIt<ContactsBloc>()),], child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ContactsListPage(),
    ));
  }
}
