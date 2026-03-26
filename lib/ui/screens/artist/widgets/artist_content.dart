import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w9_practice_firebase1/model/artist/artist.dart';
import 'package:w9_practice_firebase1/ui/widgets/artist/artist_tile.dart';

import '../../../theme/theme.dart';
import '../../../utils/async_value.dart';

import '../view_model/artist_view_model.dart';

class ArtistContent extends StatelessWidget {
  const ArtistContent({super.key});

  @override
  Widget build(BuildContext context) {
    // 1- Read the globbal song repository
    ArtistViewModel mv = context.watch<ArtistViewModel>();

    AsyncValue<List<Artist>> asyncValue = mv.artistValue;

    Widget content;
    switch (asyncValue.state) {
      
      case AsyncValueState.loading:
        content = Center(child: CircularProgressIndicator());
        break;
      case AsyncValueState.error:
        content = Center(child: Text('error = ${asyncValue.error!}', style: TextStyle(color: Colors.red),));

      case AsyncValueState.success:
        List<Artist> artist = asyncValue.data!;
        content = ListView.builder(
          itemCount: artist.length,
          itemBuilder: (context, index) => ArtistTile(
            artist: artist[index],
          
          ),
        );
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Artist", style: AppTextStyles.heading),
          SizedBox(height: 50),

          Expanded(child: content),
        ],
      ),
    );
  }
}
