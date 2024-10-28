import 'package:flutter/material.dart';

import '../../models/character.dart';
import '../../shared/styled_text.dart';
import '../../theme.dart';

class StatsTable extends StatefulWidget {
  const StatsTable(this.character, {super.key});

  final Character character;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [

          // available points
          Container(
            color: AppColors.secondaryColor,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(Icons.star,
                  color: widget.character.points > 0 ? Colors.yellow : Colors.grey,  
                ),
                const SizedBox(width: 20,),
                const StyledText('Stat points available: '),
                const Expanded(child: SizedBox(width: 20,)),
                StyledHeading(widget.character.points.toString()),
              ],
            ),
          )

          // stats table

        ],
      ),
    );
  }
}