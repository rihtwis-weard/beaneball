import 'package:flutter/material.dart';

class LineScore {
  final String teamName;
  List<int?> inningRuns;
  List<int?> extraInningRuns;
  int runs;
  int hits;
  int errors;

  LineScore(this.teamName, this.inningRuns, this.extraInningRuns, this.runs,
      this.hits, this.errors);
}

class LineScoreWidget extends StatelessWidget {
  final LineScore homeTeamLineScore;
  final LineScore awayTeamLineScore;

  const LineScoreWidget(
      {Key? key,
      required this.homeTeamLineScore,
      required this.awayTeamLineScore})
      : super(key: key);

  static const TextStyle _headerStyle =
      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Table(border: TableBorder.all(), children: [
      TableRow(children: [
        Column(children: const [
          Text(
            "Team",
            style: _headerStyle,
          ),
        ]),
        ..._createInningColumns(),
        Column(
          children: const [
            Text(
              "R",
              style: _headerStyle,
            )
          ],
        ),
        Column(
          children: const [Text("H", style: _headerStyle)],
        ),
        Column(
          children: const [Text("E", style: _headerStyle)],
        )
      ]),
      _createTeamLineScore(awayTeamLineScore),
      _createTeamLineScore(homeTeamLineScore),
    ]);
  }

  List<Widget> _createInningColumns() {
    return List.generate(
        9,
        (index) => Column(children: [
              Text(
                (index + 1).toString(),
                style: _headerStyle,
              )
            ]),
        growable: false);
  }

  TableRow _createTeamLineScore(LineScore lineScore) {
    var inningScores = lineScore.inningRuns.map((e) => Column(
          children: [Text(e != null ? e.toString() : "")],
        ));

    return TableRow(children: [
      Column(
        children: [Text(lineScore.teamName)],
      ),
      ...inningScores,
      Column(
        children: [Text(lineScore.runs.toString())],
      ),
      Column(
        children: [Text(lineScore.hits.toString())],
      ),
      Column(
        children: [Text(lineScore.errors.toString())],
      )
    ]);
  }
}
