import 'package:mafia2/app/data/models/players_model.dart';
import 'package:mafia2/app/data/provider/provider.dart';

class MafiaRepository {
  MafiaProvider? mafiaProvider;
  MafiaRepository({required this.mafiaProvider});
  List<PlayersModel> readPlayers() => mafiaProvider!.readPlayers();
  void writePlayers(List<PlayersModel> players) =>
      mafiaProvider!.writePlayers(players);

  // List<GameModel> readGamePlayers() => mafiaProvider!.readGamePlayers();
  // void writeGamePlayers(List<GameModel> players) =>
  //     mafiaProvider!.writeGamePlayers(players);
}
