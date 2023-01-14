import 'package:mafia2/app/data/models/players_model.dart';
import 'package:mafia2/app/data/provider/provider.dart';

import '../../models/game_model.dart';

class MafiaRepository {
  MafiaProvider? mafiaProvider;
  MafiaRepository({required this.mafiaProvider});
  List<PlayersModel> readPlayers() => mafiaProvider!.readPlayers();
  void writePlayers(List<PlayersModel> players) =>
      mafiaProvider!.writePlayers(players);

  List<GameModel> readGame() => mafiaProvider!.readGame();
  void writeGame(List<GameModel> game) => mafiaProvider!.writeGame(game);
}
