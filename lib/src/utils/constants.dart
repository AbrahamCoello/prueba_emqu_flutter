import 'package:fl_chart/fl_chart.dart';

const kEmailValue = 'admin';
const kPasswordValue = 'admin';
const kApiMultiAvatar = 'https://api.multiavatar.com/';
const kApiLoremflickr = 'https://loremflickr.com/';
const kApiMultiAvatarExtension = '.png';

// puede ser cualqueir nombre, pero debe ser unico
const List<Map<String, dynamic>> kNameAvatar = [
  {
    'avatarName': 'milo',
    'fullName': 'Milo Minderbinder',
  },
  {
    'avatarName': 'bradd',
    'fullName': 'Bradd Pitt',
  },
  {
    'avatarName': 'jhon',
    'fullName': 'Jhon Doe',
  },
  {
    'avatarName': 'matt',
    'fullName': 'Matt Damon',
  },
  {
    'avatarName': 'erick',
    'fullName': 'Erick Estrada',
  },
  {
    'avatarName': 'luci',
    'fullName': 'Luci Raya',
  },
  {
    'avatarName': 'fer',
    'fullName': 'Fernanda Torres',
  },
  {
    'avatarName': 'fergym',
    'fullName': 'Fergy Miler',
  },
  {
    'avatarName': 'fergymile',
    'fullName': 'Fergy Mile',
  },
  {
    'avatarName': 'dominir',
    'fullName': 'Dominic Rivas',
  },
  {
    'avatarName': 'dominiri',
    'fullName': 'Vinicius Ponte',
  },
  {
    'avatarName': 'dominirtas',
    'fullName': 'Alex Bautista',
  },
  {
    'avatarName': 'suse',
    'fullName': 'Susan Sarandon',
  },
  {
    'avatarName': 'felipe',
    'fullName': 'Felipe Rivas',
  },
  {
    'avatarName': 'jose',
    'fullName': 'Jose Villalobos',
  },
  {
    'avatarName': 'josef',
    'fullName': 'Jose Fabricio',
  },
  {
    'avatarName': 'ferdinand',
    'fullName': 'Ferdinand Cortez',
  },
  {
    'avatarName': 'ferdinand',
    'fullName': 'Ferdinando Mavarro',
  },
  {
    'avatarName': 'ferdinando',
    'fullName': 'Ferdinando Beltran',
  },
  {
    'avatarName': 'ronald',
    'fullName': 'Ronald Alvarado',
  },
  {
    'avatarName': 'ronaldinho',
    'fullName': 'Ronaldinho Gaucho',
  },
  {
    'avatarName': 'pepe',
    'fullName': 'Pepe Mendoza',
  },
  {
    'avatarName': 'tom',
    'fullName': 'Tomas Erwin',
  },
  {
    'avatarName': 'jerry',
    'fullName': 'Jerry Lewis',
  },
];

const kDataChart = {
  'monday': [
    FlSpot(0, 3),
    FlSpot(2.6, 2),
    FlSpot(4.9, 5),
    FlSpot(6.8, 3.1),
    FlSpot(8, 4),
    FlSpot(9.5, 3),
    FlSpot(11, 4),
    FlSpot(12, 5),
    FlSpot(13, 1),
    FlSpot(15, 5.5),
    FlSpot(18, 3),
    FlSpot(23, 1),
  ],
  'tuesday': [
    FlSpot(0, 1),
    FlSpot(2.6, 2),
    FlSpot(4.9, 3),
    FlSpot(6.8, 1.1),
    FlSpot(8, 2),
    FlSpot(9.5, 3),
    FlSpot(11, 2),
    FlSpot(12, 3),
    FlSpot(15, 3.5),
    FlSpot(17, 4.5),
    FlSpot(19, 4),
    FlSpot(23, 4),
  ],
  'wednesday': [
    FlSpot(0, 4),
    FlSpot(2.6, 1),
    FlSpot(4.9, 3),
    FlSpot(6.8, 1.1),
    FlSpot(8, 3),
    FlSpot(9.5, 1),
    FlSpot(11, 2),
    FlSpot(12, 2),
    FlSpot(13, 3),
    FlSpot(15, 3.5),
    FlSpot(18, 3),
    FlSpot(23, 3.7),
  ],
  'thursday': [
    FlSpot(0, 3),
    FlSpot(2.6, 1),
    FlSpot(4.9, 5),
    FlSpot(6.8, 4.1),
    FlSpot(8, 3),
    FlSpot(9.5, 1),
    FlSpot(12, 2),
    FlSpot(13, 3),
    FlSpot(15, 3.5),
    FlSpot(18, 4),
    FlSpot(23, 2),
  ],
  'friday': [
    FlSpot(0, 3),
    FlSpot(2.6, 3),
    FlSpot(4.9, 3),
    FlSpot(6.8, 1.1),
    FlSpot(8, 4),
    FlSpot(9.5, 3),
    FlSpot(11, 2),
    FlSpot(12, 3),
    FlSpot(13, 3),
    FlSpot(15, 4.5),
    FlSpot(18, 4),
    FlSpot(23, 4),
  ],
  'saturday': [
    FlSpot(0, 3),
    FlSpot(2.6, 2),
    FlSpot(4.9, 4),
    FlSpot(6.8, 3.1),
    FlSpot(8, 4),
    FlSpot(9.5, 3),
    FlSpot(11, 4),
    FlSpot(12, 3),
    FlSpot(13, 3),
    FlSpot(15, 4.5),
    FlSpot(18, 4),
    FlSpot(23, 3),
  ],
  'sunday': [
    FlSpot(0, 2),
    FlSpot(2.6, 2),
    FlSpot(4.9, 4),
    FlSpot(6.8, 1.1),
    FlSpot(8, 4),
    FlSpot(9.5, 3),
    FlSpot(11, 3),
    FlSpot(12, 4),
    FlSpot(13, 4),
    FlSpot(15, 3.5),
    FlSpot(18, 3),
    FlSpot(23, 2),
  ],
};
