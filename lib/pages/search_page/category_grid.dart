import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/localization/locale_manager.dart';

class CategoryGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localManager = Provider.of<LocalizationManager>(context);
    final List<String> _categories = [
      localManager.translate("pop"),
      localManager.translate("rock"),
      localManager.translate("hip-hop"),
      localManager.translate("jazz"),
      localManager.translate("classical"),
      localManager.translate("electronic"),
      localManager.translate("r_b"),
      localManager.translate("indie"),
      localManager.translate("country"),
      localManager.translate("podcasts"),
      localManager.translate("new_releases"),
      localManager.translate("trending"),
      localManager.translate("discover_weekly"),
      localManager.translate("chill"),
      localManager.translate("dance"),
    ];
    final List<Color> _cardColors = [
      Colors.blueAccent,
      Colors.greenAccent,
      Colors.redAccent,
      Colors.orangeAccent,
      Colors.purpleAccent,
      Colors.cyanAccent,
      Colors.indigoAccent,
      Colors.tealAccent,
      Colors.pinkAccent,
      Colors.yellowAccent,
      Colors.deepPurpleAccent,
      Colors.limeAccent,
      Colors.amberAccent,
      Colors.deepOrangeAccent,
      Colors.brown,
    ];
    final List<IconData> _musicCategoryIcons = [
      Icons.library_music,
      Icons.headset,
      Icons.music_note,
      Icons.album,
      Icons.audiotrack,
      Icons.queue_music,
      Icons.play_arrow,
      Icons.pause,
      Icons.stop,
      Icons.skip_next,
      Icons.skip_previous,
      Icons.shuffle,
      Icons.repeat,
      Icons.volume_up,
      Icons.equalizer,
    ];
    return GridView.builder(
      shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          childAspectRatio: 2/1,
          mainAxisSpacing: 12,
        ),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return Center(
            child:InkWell(
              onTap: (){
                print("Card ${_categories[index]} pressed");
              },
              borderRadius: BorderRadius.circular(8),
              splashColor: Colors.white.withOpacity(0.2),
              child: Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                color: _cardColors[index],
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Text(
                          _categories[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: getTextColor(_cardColors[index]),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        right: 8,
                        child: Icon(
                          _musicCategoryIcons[index],
                          color: getTextColor(_cardColors[index]),
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
}
  Color getTextColor(Color backgroundColor){
    double brightness = backgroundColor.computeLuminance();

    return brightness > 0.5 ? Colors.black:Colors.white;
  }
}

