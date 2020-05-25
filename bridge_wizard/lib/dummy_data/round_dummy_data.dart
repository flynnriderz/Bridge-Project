import '../models/table.dart';
import '../models/pair.dart';
import '../models/round.dart';

const DUMMY_TABLE = const [
  Tables(
    id: 't01',
    number: 1,
  ),
  Tables(
    id: 't02',
    number: 2,
  ),
  Tables(
    id: 't03',
    number: 3,
  ),
  Tables(
    id: 't04',
    number: 4,
  ),
  Tables(
    id: 't05',
    number: 5,
  ),
  Tables(
    id: 't06',
    number: 6,
  ),
  Tables(
    id: 't07',
    number: 7,
  ),
];

const DUMMY_PAIR = const [
  Pairs(
    pairID: 'p01',
    player1: 'Kyal Perkins',
    player2: 'Ameer Yoder',
  ),
  Pairs(
    pairID: 'p02',
    player1: 'Jeremy Escobar',
    player2: 'Herbert Mellor',
  ),
  Pairs(
    pairID: 'p03',
    player1: 'Roman Mcarthur',
    player2: 'Muhamed Cowan',
  ),
  Pairs(
    pairID: 'p04',
    player1: 'Jibril Mackie',
    player2: 'Jesse Carrillo',
  ),
  Pairs(
    pairID: 'p05',
    player1: 'Alexia Walter',
    player2: 'Khaleesi Tait',
  ),
  Pairs(
    pairID: 'p06',
    player1: 'Katelin Gunn',
    player2: 'Sammy-Jo Velez',
  ),
  Pairs(
    pairID: 'p07',
    player1: 'Sharon Jarvis',
    player2: 'Kamila Montoya',
  ),
  Pairs(
    pairID: 'p08',
    player1: 'Evie-Mai Frame',
    player2: 'Justine Lam',
  ),
  Pairs(
    pairID: 'p09',
    player1: 'Tyrique Thompson',
    player2: 'Sherry Morrison',
  ),
  Pairs(
    pairID: 'p10',
    player1: 'Jarrod Dolan',
    player2: 'Kush Mcconnell',
  ),
  Pairs(
    pairID: 'p11',
    player1: 'Mitchel Gay',
    player2: 'Shaquille Jenkins',
  ),
  Pairs(
    pairID: 'p12',
    player1: 'Haseeb Oconnell',
    player2: 'Kamran Frank',
  ),
  Pairs(
    pairID: 'p13',
    player1: 'Bethanie Davenport',
    player2: 'Danyal Weiss',
  ),
  Pairs(
    pairID: 'p14',
    player1: null,
    player2: null,
  ),
];

const DUMMY_COMPETITION = const [
  Rounds(competitionID: 'c0101', round: 1, table: 't01', board: [1, 2],   teamNS: 'p01', teamEW: 'p08',),
  Rounds(competitionID: 'c0102', round: 1, table: 't02', board: [3, 4],   teamNS: 'p02', teamEW: 'p09',),
  Rounds(competitionID: 'c0103', round: 1, table: 't03', board: [5, 6],   teamNS: 'p03', teamEW: 'p10',),
  Rounds(competitionID: 'c0104', round: 1, table: 't04', board: [7, 8],   teamNS: 'p04', teamEW: 'p11',),
  Rounds(competitionID: 'c0105', round: 1, table: 't05', board: [9, 10],  teamNS: 'p05', teamEW: 'p12',),
  Rounds(competitionID: 'c0106', round: 1, table: 't06', board: [11, 12], teamNS: 'p06', teamEW: 'p13',),
  Rounds(competitionID: 'c0107', round: 1, table: 't07', board: [13, 14], teamNS: 'p07', teamEW: 'p14',),

  Rounds(competitionID: 'c0201', round: 2, table: 't01', board: [3, 4],   teamNS: 'p01', teamEW: 'p14',),
  Rounds(competitionID: 'c0202', round: 2, table: 't02', board: [5, 6],   teamNS: 'p02', teamEW: 'p08',),
  Rounds(competitionID: 'c0203', round: 2, table: 't03', board: [7, 8],   teamNS: 'p03', teamEW: 'p09',),
  Rounds(competitionID: 'c0204', round: 2, table: 't04', board: [9, 10],  teamNS: 'p04', teamEW: 'p10',),
  Rounds(competitionID: 'c0205', round: 2, table: 't05', board: [11, 12], teamNS: 'p05', teamEW: 'p11',),
  Rounds(competitionID: 'c0206', round: 2, table: 't06', board: [13, 14], teamNS: 'p06', teamEW: 'p12',),
  Rounds(competitionID: 'c0207', round: 2, table: 't07', board: [1, 2],   teamNS: 'p07', teamEW: 'p13',),

  Rounds(competitionID: 'c0301', round: 3, table: 't01', board: [5, 6],   teamNS: 'p01', teamEW: 'p13',),
  Rounds(competitionID: 'c0302', round: 3, table: 't02', board: [7, 8],   teamNS: 'p02', teamEW: 'p14',),
  Rounds(competitionID: 'c0303', round: 3, table: 't03', board: [9, 10],  teamNS: 'p03', teamEW: 'p08',),
  Rounds(competitionID: 'c0304', round: 3, table: 't04', board: [11, 12], teamNS: 'p04', teamEW: 'p09',),
  Rounds(competitionID: 'c0305', round: 3, table: 't05', board: [13, 14], teamNS: 'p05', teamEW: 'p10',),
  Rounds(competitionID: 'c0306', round: 3, table: 't06', board: [1, 2],   teamNS: 'p06', teamEW: 'p11',),
  Rounds(competitionID: 'c0307', round: 3, table: 't07', board: [3, 4],   teamNS: 'p07', teamEW: 'p12',),

  Rounds(competitionID: 'c0401', round: 4, table: 't01', board: [7, 8],   teamNS: 'p01', teamEW: 'p12',),
  Rounds(competitionID: 'c0402', round: 4, table: 't02', board: [9, 10],  teamNS: 'p02', teamEW: 'p13',),
  Rounds(competitionID: 'c0403', round: 4, table: 't03', board: [11, 12], teamNS: 'p03', teamEW: 'p14',),
  Rounds(competitionID: 'c0404', round: 4, table: 't04', board: [13, 14], teamNS: 'p04', teamEW: 'p08',),
  Rounds(competitionID: 'c0405', round: 4, table: 't05', board: [1, 2],   teamNS: 'p05', teamEW: 'p09',),
  Rounds(competitionID: 'c0406', round: 4, table: 't06', board: [3, 4],   teamNS: 'p06', teamEW: 'p10',),
  Rounds(competitionID: 'c0407', round: 4, table: 't07', board: [5, 6],   teamNS: 'p07', teamEW: 'p11',),

  Rounds(competitionID: 'c0501', round: 5, table: 't01', board: [9, 10],  teamNS: 'p01', teamEW: 'p11',),
  Rounds(competitionID: 'c0502', round: 5, table: 't02', board: [11, 12], teamNS: 'p02', teamEW: 'p12',),
  Rounds(competitionID: 'c0503', round: 5, table: 't03', board: [13, 14], teamNS: 'p03', teamEW: 'p13',),
  Rounds(competitionID: 'c0504', round: 5, table: 't04', board: [1, 2],   teamNS: 'p04', teamEW: 'p14',),
  Rounds(competitionID: 'c0505', round: 5, table: 't05', board: [3, 4],   teamNS: 'p05', teamEW: 'p08',),
  Rounds(competitionID: 'c0506', round: 5, table: 't06', board: [5, 6],   teamNS: 'p06', teamEW: 'p09',),
  Rounds(competitionID: 'c0507', round: 5, table: 't07', board: [7, 8],   teamNS: 'p07', teamEW: 'p10',),

  Rounds(competitionID: 'c0601', round: 6, table: 't01', board: [11, 12], teamNS: 'p01', teamEW: 'p10',),
  Rounds(competitionID: 'c0602', round: 6, table: 't02', board: [13, 14], teamNS: 'p02', teamEW: 'p11',),
  Rounds(competitionID: 'c0603', round: 6, table: 't03', board: [1, 2],   teamNS: 'p03', teamEW: 'p12',),
  Rounds(competitionID: 'c0604', round: 6, table: 't04', board: [3, 4],   teamNS: 'p04', teamEW: 'p13',),
  Rounds(competitionID: 'c0605', round: 6, table: 't05', board: [5, 6],   teamNS: 'p05', teamEW: 'p14',),
  Rounds(competitionID: 'c0606', round: 6, table: 't06', board: [7, 8],   teamNS: 'p06', teamEW: 'p08',),
  Rounds(competitionID: 'c0607', round: 6, table: 't07', board: [9, 10],  teamNS: 'p07', teamEW: 'p09',),

  Rounds(competitionID: 'c0701', round: 7, table: 't01', board: [13, 14], teamNS: 'p01', teamEW: 'p09',),
  Rounds(competitionID: 'c0702', round: 7, table: 't02', board: [1, 2],   teamNS: 'p02', teamEW: 'p10',),
  Rounds(competitionID: 'c0703', round: 7, table: 't03', board: [3, 4],   teamNS: 'p03', teamEW: 'p11',),
  Rounds(competitionID: 'c0704', round: 7, table: 't04', board: [5, 6],   teamNS: 'p04', teamEW: 'p12',),
  Rounds(competitionID: 'c0705', round: 7, table: 't05', board: [7, 8],   teamNS: 'p05', teamEW: 'p13',),
  Rounds(competitionID: 'c0706', round: 7, table: 't06', board: [9, 10],  teamNS: 'p06', teamEW: 'p14',),
  Rounds(competitionID: 'c0707', round: 7, table: 't07', board: [11, 12], teamNS: 'p07', teamEW: 'p08',),
];
