import 'package:flutter/material.dart';
import 'package:flutter_app/src/presentation/pages/allbum/home_page.dart';
import 'package:flutter_app/src/presentation/pages/splash/splash_bloc.dart';
import 'package:flutter_app/src/widgets/loading_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SplashBloc _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = context.read<SplashBloc>();

    _bloc.add(SplashStartLoadingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: _bloc,
        child: BlocListener<SplashBloc, SplashState>(
          listener: (BuildContext content, SplashState state) {
            if (state is SplashFinished) {
              _navigateToAlbums(context);
            }
          },
          child: const LoadingWidget(),
        ),
      ),
    );
  }
  
  void _navigateToAlbums(BuildContext context) {
     Navigator.pushNamedAndRemoveUntil(
        context, HomePage.routeName, (r) => false);
  }
}
