import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cleanartchictor_examp/injection_container.dart' as di;
import 'package:flutter_cleanartchictor_examp/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/presentation/bloc/posts/posts_event.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/presentation/pages/posts_page.dart';

import 'core/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => di.sl<PostsBloc>()..add(GetAllPostsEvent())),
        BlocProvider(create: (_) => di.sl<AddDeleteUpdatePostBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        themeMode: ThemeMode.system,
        home: PostsPage(),
      ),
    );
  }
}
