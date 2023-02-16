import 'package:flutter/material.dart';
import 'package:flutter_app/src/common/constants/app_strings.dart';
import 'package:flutter_app/src/common/constants/app_ui_helpers.dart';
import 'package:flutter_app/src/common/constants/app_colors.dart';

import 'package:flutter_app/src/domain/models/album.dart';
import 'package:flutter_app/src/presentation/pages/allbum/albums_bloc.dart';
import 'package:flutter_app/src/presentation/pages/photo/photo_page.dart';
import 'package:flutter_app/src/widgets/album_card_widget.dart';
import 'package:flutter_app/src/widgets/loading_widget.dart';
import 'package:flutter_app/src/widgets/primary_button_widget.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../dataloader.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/home_page';
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AlbumsBloc _bloc;

  bool albumsLoad = false;
  bool isDescending = false;
  late List<AlbumData> albums = [];

  @override
  void initState() {
    super.initState();
    _bloc = context.read<AlbumsBloc>();
    _bloc.add(AlbumsBlocLoadAllEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: BlocConsumer<AlbumsBloc, AlbumsState>(
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case AlbumsLoaded:
              return _scaffold(Center(
                child: Padding(
                  padding: kHorizonalInsets,
                  child: _albumWidget(context),
                ),
              ));

            case AlbumsLoadFailed:
              return _scaffold(const Center(
                child: Text(kUnableToLoadError),
              ));
            case AlbumsLoading:
            default:
              return _scaffold(const LoadingWidget());
          }
        },
      ),
    );
  }

  Widget _scaffold(Widget body) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kcPrimaryColor,
          title: const   Text('Listing albums'),
          centerTitle: true,
        ),
        body: body,
        );
  }

  _albumWidget(BuildContext context) {
    return BlocBuilder<AlbumsBloc, AlbumsState>(
      builder: (context, AlbumsState state) {
        if (state is AlbumsLoaded) {
          List<AlbumData>? albums = state.albums;

          if (albums == null || albums.isEmpty) {
            return _buildEmptyWidget(context);
          }
          return RefreshIndicator(
            child: Column(children: [
              TextButton.icon( icon: const RotatedBox(
              quarterTurns: 1,
              child: Icon(
                Icons.compare_arrows,
                size: 28,
              ),
            ), label: Text(
              isDescending ? 'Descending' : 'Ascending',
              style: const TextStyle(fontSize: 16),
            ),
                onPressed: () => setState(() => isDescending = !isDescending),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: albums.length,
                  itemBuilder: (context, index) =>
                  
          _albumCard(context, albums[index]),
          ),
              ),
            ]),
            onRefresh: () async {
              _bloc.add(AlbumsBlocLoadAllEvent());
            },
          );
        } else if (state is AlbumsLoadFailed) {
          return const Text(kUnableToLoadError);
        }
        return const LoadingWidget();
      },
    );
  }

  _buildEmptyWidget(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(kAlbumsListEmpty),
        ),
        PrimaryButtonWidget(
            title: kTryAgain,
            onPressed: () {
              _bloc.add(AlbumsBlocLoadAllEvent());
            })
      ],
    );
  }

  _albumCard(BuildContext context, AlbumData album) {
     return AlbumCardWidget(
        model: album,
        onTap: () {
          _navigateToAlbumInfo(context, album.id);
        });
  }
  
  void _navigateToAlbumInfo(BuildContext context, int albumId) {
    Navigator.pushNamed(context, PhotoPage.routeName,arguments: PhotoPageRouteArguments(albumId: albumId),);
  }

   _albumsSort(BuildContext context, List<AlbumData> albums) {
    return ListView.builder(
        itemCount: albums.length,
        itemBuilder: (context, index) {
          final sortedAlbums = albums
            ..sort((album1, album2) => isDescending
                ? album2.title.compareTo(album1.title)
                : album1.title.compareTo(album2.title));
          final album = sortedAlbums[index].title;
        });
  }
}
