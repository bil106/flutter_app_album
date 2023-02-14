import 'package:flutter/material.dart';
import 'package:flutter_app/src/common/constants/app_colors.dart';
import 'package:flutter_app/src/common/constants/app_strings.dart';
import 'package:flutter_app/src/common/constants/app_ui_helpers.dart';
import 'package:flutter_app/src/domain/models/album.dart';
import 'package:flutter_app/src/widgets/loading_widget.dart';
import 'package:flutter_app/src/widgets/photo_card_widget.dart';
import 'package:flutter_app/src/widgets/primary_button_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'photo_bloc.dart';

class PhotoPage extends StatefulWidget {
  static String routeName = '/photo_page';

  final PhotoPageRouteArguments args;

  const PhotoPage({
    super.key,
    required this.args,
  });

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  late PhotoBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<PhotoBloc>();
    _bloc.add(PhotoPageLoadEvent(widget.args.albumId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: BlocConsumer<PhotoBloc,PhotoState>(
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case PhotoLoaded:
              return _scaffold(Center(
                child: Padding(
                  padding: kHorizonalInsets,
                  child: _albumPhotoWidget(context),
                ),
              ));

            case PhotoLoadFailed:
              return _scaffold(const Center(
                child: Text(kUnableToLoadError),
              ));
            case PhotoLoading:
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
        title: const Text(kAlbumPhotosTitle),
        centerTitle: true,
      ),
      body: body,
    );
  }
Widget _photoCard(BuildContext context, AlbumData album) {
    return PhotoCardWidget(
      model: album,
      onTap: () {},
    );
  }
 
Widget _albumPhotoWidget(BuildContext context) {
    return BlocBuilder<PhotoBloc, PhotoState>(
      builder: (context, PhotoState state) {
        if (state is PhotoLoaded) {
          List<AlbumData>? albums = state.photo;

          if (albums == null || albums.isEmpty) {
            return _buildEmptyWidget(context);
          }
          return RefreshIndicator(
            onRefresh: () async {
                _bloc.add(PhotoPageLoadEvent(widget.args.albumId));
              },
              child: Column(children: [
                Expanded(
                    child: ListView.builder(
                  itemCount: albums.length,
                  itemBuilder: (context, index) =>
                      _photoCard(context, albums[index]),),
                ),
              ]),);
        } else if (state is PhotoLoadFailed) {
          return const Text(kUnableToLoadError);
        }
        return const LoadingWidget();
      },
    );
  }

 Widget _buildEmptyWidget(BuildContext context) {
    return Column(
      children:  [
     const Center(
          child: Text(kAlbumPhotosListEmpty),
        ),PrimaryButtonWidget(title: kTryAgain,onPressed: () {
          _bloc.add(PhotoPageLoadEvent(widget.args.albumId));
        },)
      ],
    );
  }

 
}

class PhotoPageRouteArguments {
  final int albumId;
  PhotoPageRouteArguments({required this.albumId});
}
