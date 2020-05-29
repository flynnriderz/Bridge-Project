import '../models/table.dart';
import '../models/pair.dart';
import '../models/round.dart';

var dummyTable = [
];

var dummyPair = [
  
];

 var dummyRound = [
  Rounds(roundID: 'c0101', round_NO: 1, table_NO: '1', board_NO: [1, 2],   team_NS: '1', team_EW: '8',),
  Rounds(roundID: 'c0102', round_NO: 1, table_NO: '2', board_NO: [3, 4],   team_NS: '2', team_EW: '9',),
  Rounds(roundID: 'c0103', round_NO: 1, table_NO: '3', board_NO: [5, 6],   team_NS: '3', team_EW: '10',),
  Rounds(roundID: 'c0104', round_NO: 1, table_NO: '4', board_NO: [7, 8],   team_NS: '4', team_EW: '11',),
  Rounds(roundID: 'c0105', round_NO: 1, table_NO: '5', board_NO: [9, 10],  team_NS: '5', team_EW: '12',),
  Rounds(roundID: 'c0106', round_NO: 1, table_NO: '6', board_NO: [11, 12], team_NS: '6', team_EW: '13',),
  Rounds(roundID: 'c0107', round_NO: 1, table_NO: '7', board_NO: [13, 14], team_NS: '7', team_EW: '14',),

  Rounds(roundID: 'c0201', round_NO: 2, table_NO: '1', board_NO: [3, 4],   team_NS: '1', team_EW: '14',),
  Rounds(roundID: 'c0202', round_NO: 2, table_NO: '2', board_NO: [5, 6],   team_NS: '2', team_EW: '8',),
  Rounds(roundID: 'c0203', round_NO: 2, table_NO: '3', board_NO: [7, 8],   team_NS: '3', team_EW: '9',),
  Rounds(roundID: 'c0204', round_NO: 2, table_NO: '4', board_NO: [9, 10],  team_NS: '4', team_EW: '10',),
  Rounds(roundID: 'c0205', round_NO: 2, table_NO: '5', board_NO: [11, 12], team_NS: '5', team_EW: '11',),
  Rounds(roundID: 'c0206', round_NO: 2, table_NO: '6', board_NO: [13, 14], team_NS: '6', team_EW: '12',),
  Rounds(roundID: 'c0207', round_NO: 2, table_NO: '7', board_NO: [1, 2],   team_NS: '7', team_EW: '13',),

  Rounds(roundID: 'c0301', round_NO: 3, table_NO: '1', board_NO: [5, 6],   team_NS: '1', team_EW: '13',),
  Rounds(roundID: 'c0302', round_NO: 3, table_NO: '2', board_NO: [7, 8],   team_NS: '2', team_EW: '14',),
  Rounds(roundID: 'c0303', round_NO: 3, table_NO: '3', board_NO: [9, 10],  team_NS: '3', team_EW: '8',),
  Rounds(roundID: 'c0304', round_NO: 3, table_NO: '4', board_NO: [11, 12], team_NS: '4', team_EW: '9',),
  Rounds(roundID: 'c0305', round_NO: 3, table_NO: '5', board_NO: [13, 14], team_NS: '5', team_EW: '10',),
  Rounds(roundID: 'c0306', round_NO: 3, table_NO: '6', board_NO: [1, 2],   team_NS: '6', team_EW: '11',),
  Rounds(roundID: 'c0307', round_NO: 3, table_NO: '7', board_NO: [3, 4],   team_NS: '7', team_EW: '12',),

  Rounds(roundID: 'c0401', round_NO: 4, table_NO: '1', board_NO: [7, 8],   team_NS: '1', team_EW: '12',),
  Rounds(roundID: 'c0402', round_NO: 4, table_NO: '2', board_NO: [9, 10],  team_NS: '2', team_EW: '13',),
  Rounds(roundID: 'c0403', round_NO: 4, table_NO: '3', board_NO: [11, 12], team_NS: '3', team_EW: '14',),
  Rounds(roundID: 'c0404', round_NO: 4, table_NO: '4', board_NO: [13, 14], team_NS: '4', team_EW: '8',),
  Rounds(roundID: 'c0405', round_NO: 4, table_NO: '5', board_NO: [1, 2],   team_NS: '5', team_EW: '9',),
  Rounds(roundID: 'c0406', round_NO: 4, table_NO: '6', board_NO: [3, 4],   team_NS: '6', team_EW: '10',),
  Rounds(roundID: 'c0407', round_NO: 4, table_NO: '7', board_NO: [5, 6],   team_NS: '7', team_EW: '11',),

  Rounds(roundID: 'c0501', round_NO: 5, table_NO: '1', board_NO: [9, 10],  team_NS: '1', team_EW: '11',),
  Rounds(roundID: 'c0502', round_NO: 5, table_NO: '2', board_NO: [11, 12], team_NS: '2', team_EW: '12',),
  Rounds(roundID: 'c0503', round_NO: 5, table_NO: '3', board_NO: [13, 14], team_NS: '3', team_EW: '13',),
  Rounds(roundID: 'c0504', round_NO: 5, table_NO: '4', board_NO: [1, 2],   team_NS: '4', team_EW: '14',),
  Rounds(roundID: 'c0505', round_NO: 5, table_NO: '5', board_NO: [3, 4],   team_NS: '5', team_EW: '8',),
  Rounds(roundID: 'c0506', round_NO: 5, table_NO: '6', board_NO: [5, 6],   team_NS: '6', team_EW: '9',),
  Rounds(roundID: 'c0507', round_NO: 5, table_NO: '7', board_NO: [7, 8],   team_NS: '7', team_EW: '10',),

  Rounds(roundID: 'c0601', round_NO: 6, table_NO: '1', board_NO: [11, 12], team_NS: '1', team_EW: '10',),
  Rounds(roundID: 'c0602', round_NO: 6, table_NO: '2', board_NO: [13, 14], team_NS: '2', team_EW: '11',),
  Rounds(roundID: 'c0603', round_NO: 6, table_NO: '3', board_NO: [1, 2],   team_NS: '3', team_EW: '12',),
  Rounds(roundID: 'c0604', round_NO: 6, table_NO: '4', board_NO: [3, 4],   team_NS: '4', team_EW: '13',),
  Rounds(roundID: 'c0605', round_NO: 6, table_NO: '5', board_NO: [5, 6],   team_NS: '5', team_EW: '14',),
  Rounds(roundID: 'c0606', round_NO: 6, table_NO: '6', board_NO: [7, 8],   team_NS: '6', team_EW: '8',),
  Rounds(roundID: 'c0607', round_NO: 6, table_NO: '7', board_NO: [9, 10],  team_NS: '7', team_EW: '9',),

  Rounds(roundID: 'c0701', round_NO: 7, table_NO: '1', board_NO: [13, 14], team_NS: '1', team_EW: '9',),
  Rounds(roundID: 'c0702', round_NO: 7, table_NO: '2', board_NO: [1, 2],   team_NS: '2', team_EW: '10',),
  Rounds(roundID: 'c0703', round_NO: 7, table_NO: '3', board_NO: [3, 4],   team_NS: '3', team_EW: '11',),
  Rounds(roundID: 'c0704', round_NO: 7, table_NO: '4', board_NO: [5, 6],   team_NS: '4', team_EW: '12',),
  Rounds(roundID: 'c0705', round_NO: 7, table_NO: '5', board_NO: [7, 8],   team_NS: '5', team_EW: '13',),
  Rounds(roundID: 'c0706', round_NO: 7, table_NO: '6', board_NO: [9, 10],  team_NS: '6', team_EW: '14',),
  Rounds(roundID: 'c0707', round_NO: 7, table_NO: '7', board_NO: [11, 12], team_NS: '7', team_EW: '8',),
];
