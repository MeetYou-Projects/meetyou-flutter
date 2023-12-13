import 'package:flutter/material.dart';
import 'package:meetyou/app.dart';
import 'package:meetyou/features/authentication/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meetyou/features/likes/bloc/explore_people/explore_people_bloc.dart';
import 'package:meetyou/features/likes/bloc/people_likes/people_likes_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => ExplorePeopleBloc(),
        ),
        BlocProvider(
          create: (context) => PeopleLikesBloc(),
        ),
      ],
      child: const AppScreen(),
    );
  }
}
