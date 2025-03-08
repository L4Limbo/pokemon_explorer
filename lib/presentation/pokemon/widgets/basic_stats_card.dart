import 'package:flutter/material.dart';
import 'package:icons_launcher/cli_commands.dart';
import 'package:pokemon_explorer/domain/models/pokemon/basic_stat.dart';

class BasicStatsCard extends StatelessWidget {
  const BasicStatsCard({super.key, required this.stats});

  final List<BasicStat> stats;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 600),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Text(
                  'Basic Stats',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (var stat in stats)
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: [
                                    TextSpan(
                                      text: stat.name.capitalize(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: LinearProgressIndicator(
                                  borderRadius: BorderRadius.circular(20),
                                  value: stat.value / 255,
                                  minHeight: 16,
                                  backgroundColor: Colors.white,
                                  color: stat.value / 255 < 0.2
                                      ? Colors.red
                                      : stat.value / 255 < 0.5
                                          ? Colors.orange
                                          : Colors.green,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textAlign: TextAlign.right,
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: [
                                    TextSpan(
                                      text: stat.value.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
