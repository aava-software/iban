# -*- encoding : utf-8 -*-

#
module Iban
  def self.new(iban_string)
    Iban.new(iban_string)
  end

  # Class for validating iban account number correctness
  # Also provides service to find bic-code based on iban number
  class Iban
    attr_reader :errors
    attr_reader :iban

    def initialize(iban_string)
      @iban = (iban_string || '').delete(', ').delete(' ').upcase
    end

    # Validates an iban bank-account
    #
    # Returns true if the account-number is valid, false otherwise. Reason for failure is
    # available on errors attribute
    #
    def validate
      @errors ||= Array(check_for_errors)
      errors.empty?
    end

    # Returns the bic for this IBAN. Returns nil if bic is not found
    def bic
      return if iban.nil? || iban.empty?
      return unless validate

      bic_matcher = BicMatcher.new(iban)
      (BIC_DATA[country_code] || []).each do |codes, bic|
        return bic if bic_matcher.match?(codes)
      end
      nil
    end

    private

    def check_for_errors
      if iban.empty?
        'IBAN validation error, empty input string'
      elsif country_code.nil?
        invalid_country_code
      elsif country_code_index.nil?
        unknown_country_code
      elsif length_correct?
        incorrect_iban_length
      elsif !checksum_correct?
        checksum_error
      end
    end

    def invalid_country_code
      "IBAN validation error, #{iban} invalid country code"
    end

    def unknown_country_code
      "IBAN validation error, #{iban} unknown country code"
    end

    def incorrect_iban_length
      "IBAN validation error, #{iban} incorrect length, expected: #{country_code_length}"
    end

    def checksum_error
      "IBAN validation error, #{iban} checksum error"
    end

    def length_correct?
      iban.length != country_code_length
    end

    def checksum_correct?
      iban_head = iban.match(/(^[A-Z]{2}[0-9]{2})/)[0]
      iban_tail = "#{iban[4..-1]}#{iban_head}"
      iban_tail = iban_tail.gsub(/[ABCDEFGHIJKLMNOPQRSTUVWXYZ]/, LETTERS_TO_NUMBERS)
      (iban_tail.to_i % 97) == 1
    end

    def country_code
      (iban.match(/^[A-Z]{2}/) || [])[0]
    end

    def country_code_index
      COUNTRY_CODES.transpose[0].index(country_code)
    end

    def country_code_length
      COUNTRY_CODES[country_code_index][2]
    end
  end
end
