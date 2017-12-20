TYPE_NORMAL = 0;
TYPE_FIRE = 1;
TYPE_WATER = 2;
TYPE_ELECTRIC = 3;
TYPE_GRASS = 4;
TYPE_ICE = 5;
TYPE_FIGHTING = 6;
TYPE_POISON = 7;
TYPE_GROUND = 8;
TYPE_FLYING = 9;
TYPE_PSYCHIC = 10;
TYPE_BUG = 11;
TYPE_ROCK = 12;
TYPE_GHOST = 13;
TYPE_DRAGON = 14;
TYPE_DARK = 15;
TYPE_STEEL = 16;
TYPE_FAIRY = 17;

DAMAGE_TYPE = [
  'NORMAL'=>1,
  'MISSED'=>2,
  'CRITICAL'=>3,
  'DOUBLE_DAMAGE'=>4,
  'HALF_DAMAGE'=>5,
  'NO_DAMAGE'=>6,
  'CRITICAL_2XDAMAGE'=>12,
  'CRITICAL_HALF_DAMAGE'=>15,
].freeze

ATTACK_TYPE = [
  TYPE_NORMAL => 'normal',
  TYPE_FIRE => 'fire',
  TYPE_WATER => 'water',
  TYPE_ELECTRIC => 'electric',
  TYPE_GRASS => 'grass',
  TYPE_ICE => 'ice',
  TYPE_FIGHTING => 'fighting',
  TYPE_POISON => 'poison',
  TYPE_GROUND => 'ground',
  TYPE_FLYING => 'flying',
  TYPE_PSYCHIC => 'psychic',
  TYPE_BUG => 'bug',
  TYPE_ROCK => 'rock',
  TYPE_GHOST => 'ghost',
  TYPE_DRAGON => 'dragon',
  TYPE_DARK => 'dark',
  TYPE_STEEL => 'steel',
  TYPE_FAIRY => 'fairy',  
].freeze

TYPE_MODIFIER_DESCRIPTION = [
  DAMAGE_TYPE[0]['NORMAL']                  => 'NORMAL',
  DAMAGE_TYPE[0]['MISSED']                  => '(Missed!)',
  DAMAGE_TYPE[0]['CRITICAL']                => '(CRITICAL Hit!)',
  DAMAGE_TYPE[0]['DOUBLE_DAMAGE']           => "It's super effective!",
  DAMAGE_TYPE[0]['HALF_DAMAGE']             => "It's not very effective... ",
  DAMAGE_TYPE[0]['NO_DAMAGE']               => "It's not effective ",
  DAMAGE_TYPE[0]['CRITICAL_2XDAMAGE']       => "It's super effective! (Critical)",
  DAMAGE_TYPE[0]['CRITICAL_HALF_DAMAGE']    => 'Not implemented',
].freeze

TYPE_MODIFIER_MULTIPLIER = [
  DAMAGE_TYPE[0]['NORMAL']                  => 10,
  DAMAGE_TYPE[0]['MISSED']                  => 0,
  DAMAGE_TYPE[0]['CRITICAL']                => 17,
  DAMAGE_TYPE[0]['DOUBLE_DAMAGE']           => 20,
  DAMAGE_TYPE[0]['HALF_DAMAGE']             => 2.5,
  DAMAGE_TYPE[0]['NO_DAMAGE']               => 0,
  DAMAGE_TYPE[0]['CRITICAL_2XDAMAGE']       => 27,
  DAMAGE_TYPE[0]['CRITICAL_HALF_DAMAGE']    => 0,
].freeze

TYPE_MODIFIER = [
  [1,1,1,1,1,1,1,1,1,1,1,1,0.5,0,1,1,0.5,0],
  [1,0.5,0.5,1,2,2,1,1,1,1,1,2,0.5,1,0.5,1,2,1],
  [1,2,0.5,1,0.5,1,1,1,2,1,1,1,2,1,0.5,1,1,1],
  [1,1,2,0.5,0.5,1,1,1,0,2,1,1,1,1,0.5,1,1,1],
  [1,0.5,2,1,0.5,1,1,0.5,2,0.5,1,0.5,2,1,0.5,1,0.5,1],
  [1,0.5,0.5,1,2,0.5,1,1,2,2,1,1,1,1,2,1,0.5,1],
  [2,1,1,1,1,2,1,0.5,1,0.5,0.5,0.5,2,0,1,2,2,0.5],
  [1,1,1,1,2,1,1,0.5,0.5,1,1,1,0.5,0.5,1,1,0,2],
  [1,2,1,2,0.5,1,1,2,1,0,1,0.5,2,1,1,1,2,1],
  [1,1,1,0.5,2,1,2,1,1,1,1,2,0.5,1,1,1,0.5,1],
  [1,1,1,1,1,1,2,2,1,1,0.5,1,1,1,1,0,0.5,1],
  [1,0.5,1,1,2,1,0.5,0.5,1,0.5,2,1,1,0.5,1,2,0.5,0.5],
  [1,2,1,1,1,2,0.5,1,0.5,2,1,2,1,1,1,1,0.5,1],
  [0,1,1,1,1,1,1,1,1,1,2,1,1,2,1,0.5,1,1],
  [1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,0.5,0],
  [1,1,1,1,1,1,0.5,1,1,1,2,1,1,2,1,0.5,1,0.5],
  [1,0.5,0.5,0.5,1,2,1,1,1,1,1,1,2,1,1,1,0.5,2],
  [1,0.5,1,1,1,1,2,0.5,1,1,1,1,1,1,2,2,0.5,1],
].freeze