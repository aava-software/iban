# -*- encoding : utf-8 -*-
module Iban
  BIC_DATA = {
    # whitespaces are not allowed on code strings. Use '34,8' and not '34, 8'
    'FI' => {
      '405' => 'HELSFIHH',
      '497' => 'HELSFIHH',
      '717' => 'BIGKFIH1',
      '470-478' => 'POPFFI22',
      '479' => 'POPFFI22',
      '713' => 'CITIFIHX',
      '34,8' => 'DABAFIHH',
      '37' => 'DNBAFIHX',
      '31' => 'HANDFIHH',
      '799' => 'HOLVFIHH',
      '1' => 'NDEAFIHH',
      '2' => 'NDEAFIHH',
      '5' => 'OKOYFIHH',
      '33' => 'ESSEFIHX',
      '36,39' => 'SBANFIHH',
      '38' => 'SWEDFIHH',
      '715' => 'ITELFIHH',
      '400' => 'ITELFIHH',
      '402' => 'ITELFIHH',
      '403' => 'ITELFIHH',
      '406-408' => 'ITELFIHH',
      '410-412' => 'ITELFIHH',
      '414-421' => 'ITELFIHH',
      '423-432' => 'ITELFIHH',
      '435-452' => 'ITELFIHH',
      '454-464' => 'ITELFIHH',
      '483-493' => 'ITELFIHH',
      '495-496' => 'ITELFIHH',
      '6' => 'AABAFI22'
    },
    'EE' => {
      '42' => 'EKRDEE22',
      '16' => 'EPBEEE2X',
      '10' => 'EEUHEE2X',
      '22' => 'HABAEE2X',
      '96' => 'RIKOEE22',
      '17' => 'NDEAEE2X',
      '12' => 'PARXEE22',
      '33' => 'FOREEE2X',
      '83' => 'HANDEE22',
      '00' => 'TABUEE22',
      '51' => 'OKOYEE2X',
      '77' => 'LHVBEE22',
      '75' => 'BIGKEE2B'
    }
  }.freeze

  COUNTRY_CODES = [
    ['AL', 'Albania', 28], ['AD', 'Andorra',	24], ['AT', 'Austria',	20],
    ['BE', 'Belgium',	16], ['BA', 'Bosnia and Herzegovina', 20], ['BG', 'Bulgaria', 22],
    ['HR', 'Croatia', 21], ['CY', 'Cyprus', 28], ['CZ', 'Czech Republic', 24],
    ['DK', 'Denmark', 18], ['EE', 'Estonia', 20], ['FO', 'Faroe Islands', 18],
    ['FI', 'Finland', 18], ['FR', 'France', 27], ['GE', 'Georgia', 22], ['DE', 'Germany', 22],
    ['GI', 'Gibraltar', 23], ['GR', 'Greece', 27], ['GL', 'Greenland', 18],
    ['HU', 'Hungary', 28], ['IS', 'Iceland', 26], ['IE', 'Ireland', 22], ['IT', 'Italy', 27],
    ['XK', 'Kosovo', 20], ['LV', 'Latvia', 21], ['LI', 'Liechtenstein', 21],
    ['LT', 'Lithuania', 20], ['LU', 'Luxembourg', 20], ['MK', 'Macedonia', 19],
    ['MT', 'Malta', 31], ['MD', 'Moldova', 24], ['MC', 'Monaco', 27], ['ME', 'Montenegro', 22],
    ['NL', 'Netherlands', 18], ['NO', 'Norway', 15], ['PL', 'Poland', 28],
    ['PT', 'Portugal', 25], ['RO', 'Romania', 24], ['SM', 'San Marino', 27],
    ['RS', 'Serbia', 22], ['SK', 'Slovakia', 24], ['SI', 'Slovenia', 19], ['ES', 'Spain', 24],
    ['SE', 'Sweden', 24], ['CH', 'Switzerland', 21], ['UA', 'Ukraine', 29],
    ['GB', 'United Kingdom', 22]
  ].freeze

  LETTERS_TO_NUMBERS = {
    'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14,
    'F' => 15, 'G' => 16, 'H' => 17, 'I' => 18, 'J' => 19,
    'K' => 20, 'L' => 21, 'M' => 22, 'N' => 23, 'O' => 24,
    'P' => 25, 'Q' => 26, 'R' => 27, 'S' => 28, 'T' => 29,
    'U' => 30, 'V' => 31, 'W' => 32, 'X' => 33, 'Y' => 34,
    'Z' => 35
  }.freeze
end
