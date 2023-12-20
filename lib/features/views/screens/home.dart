import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:wallpaper_flutter_demo4/core/widgets/base_scaffold.dart';
import 'package:wallpaper_flutter_demo4/features/viewModels/home/home_cubit.dart';
import 'package:wallpaper_flutter_demo4/features/views/screens/image_detail.dart';
import 'package:wallpaper_flutter_demo4/features/views/widgets/image_tile.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Wallpaper Demo',
      colors: const [
        Colors.white,
        Colors.black,
      ],
      body: SafeArea(
        child: BlocProvider(
          create: (context) => HomeCubit()..init(),
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              if (!state.isLoading && state.photoModel.isNotEmpty) {
                EasyLoading.showSuccess('Images Fetched successfully');
              }
            },
            builder: (context, state) {
              if (state.isLoading) {
                EasyLoading.show();
              }
              if (!state.isLoading && state.photoModel.isNotEmpty) {
                final photos = state.photoModel;

                return ListView.builder(
                  itemCount: photos.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ImageDetailsPage(
                          url: photos[index].urls!.raw!,
                          description: photos[index].description ??
                              photos[index].altDescription.toString(),
                          likes: photos[index].likes!,
                        ),
                      ),
                    ),
                    child: ImageTile(
                      url: photos[index].urls!.raw!,
                      description: photos[index].description ??
                          photos[index].altDescription.toString(),
                      likes: photos[index].likes!,
                    ),
                  ),
                );
              }

              return Container();
            },
          ),
        ),
      ),
    );
  }
}
