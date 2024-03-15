import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_list/pages/task_form_page.dart';
import 'package:task_list/pages/task_list_page.dart';
import 'package:task_list/providers/task_list.dart';
import 'package:task_list/routes/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(create: (_) => TaskList()),
      ],
      child: MaterialApp(
          theme: ThemeData(
            useMaterial3: false,
          ),
          debugShowCheckedModeBanner: false,
          routes: {
            AppRoutes.home: (_) => const TaskListPage(),
          }),
    );
  }
}
