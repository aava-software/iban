# -*- encoding : utf-8 -*-

#
module Iban
  class BicMatcher # :nodoc:
    attr_reader :iban
    def initialize(iban_string)
      @iban = iban_string
    end

    def match?(code_data)
      # values may be comma separated
      codes = code_data.split(',')
      codes.map! do |code|
        # is a range?
        code['-'].nil? ? code : codes_from_range(code)
      end
      codes.flatten!

      codes.any? { |code| code_matches_iban?(code) }
    end

    private

    def codes_from_range(code_data)
      codes = code_data.split('-').map(&:to_i)
      (codes[0]..codes[1]).map(&:to_s)
    end

    def code_matches_iban?(code) # :nodoc:
      iban[4..(3 + code.size)] == code
    end
  end
end
