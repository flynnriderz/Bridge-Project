import '../models/table.dart';
import '../models/pair.dart';
import '../models/round.dart';

var dummyTable = [
  Tables(
    //collection
    round: [],
    //field
    key: 't01',
    table_NO: '1',
  ),
  Tables(
    //collection
    round: [],
    //field
    key: 't02',
    table_NO: '2',
  ),
  Tables(
   //collection
    round: [],
    //field
    key: 't03',
    table_NO: '3',
  ),
  Tables(
    //collection
    round: [],
    //field
    key: 't04',
    table_NO: '4',
  ),
  Tables(
    //collection
    round: [],
    //field
    key: 't05',
    table_NO: '5',
  ),
  Tables(
    //collection
    round: [],
    //field
    key: 't06',
    table_NO: '6',
  ),
  Tables(
    //collection
    round: [],
    //field
    key: 't07',
    table_NO: '7',
  ),
];

var dummyPair = [
  Pairs(
    pin: 'p01',
    team_NO: '1',
    player1: 'Kyal Perkins',
    player2: 'Ameer Yoder',
  ),
  Pairs(
    pin: 'p02',
    team_NO: '2',
    player1: 'Jeremy Escobar',
    player2: 'Herbert Mellor',
  ),
  Pairs(
    pin: 'p03',
    team_NO: '3',
    player1: 'Roman Mcarthur',
    player2: 'Muhamed Cowan',
  ),
  Pairs(
    pin: 'p04',
    team_NO: '4',
    player1: 'Jibril Mackie',
    player2: 'Jesse Carrillo',
  ),
  Pairs(
    pin: 'p05',
    team_NO: '5',
    player1: 'Alexia Walter',
    player2: 'Khaleesi Tait',
  ),
  Pairs(
    pin: 'p06',
    team_NO: '6',
    player1: 'Katelin Gunn',
    player2: 'Sammy-Jo Velez',
  ),
  Pairs(
    pin: 'p07',
    team_NO: '7',
    player1: 'Sharon Jarvis',
    player2: 'Kamila Montoya',
  ),
  Pairs(
    pin: 'p08',
    team_NO: '8',
    player1: 'Evie-Mai Frame',
    player2: 'Justine Lam',
  ),
  Pairs(
    pin: 'p09',
    team_NO: '9',
    player1: 'Tyrique Thompson',
    player2: 'Sherry Morrison',
  ),
  Pairs(
    pin: 'p10',
    team_NO: '10',
    player1: 'Jarrod Dolan',
    player2: 'Kush Mcconnell',
  ),
  Pairs(
    pin: 'p11',
    team_NO: '11',
    player1: 'Mitchel Gay',
    player2: 'Shaquille Jenkins',
  ),
  Pairs(
    pin: 'p12',
    team_NO: '12',
    player1: 'Haseeb Oconnell',
    player2: 'Kamran Frank',
  ),
  Pairs(
    pin: 'p13',
    team_NO: '13',
    player1: 'Bethanie Davenport',
    player2: 'Danyal Weiss',
  ),
  Pairs(
    pin: 'p14',
    team_NO: '14',
  ),
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
