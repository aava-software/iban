require 'iban'

RSpec.describe Iban::Iban do
  describe '#initialize' do
    context 'when iban is nil' do
      it 'creates an instance, but instance has no valid iban' do
        iban = described_class.new(nil)
        expect(iban.validate).to be_falsey
        expect(iban.errors.to_s).to include 'empty'
      end
    end
  end

  describe '#validate' do
    context 'when iban is empty' do
      it 'returns not true' do
        iban = described_class.new('')
        expect(iban.validate).to be_falsey
        expect(iban.errors.to_s).to include 'empty'
      end
    end

    context 'when iban is malformed' do
      it 'returns not true' do
        # use capital 'o' instead of zero
        iban = described_class.new('FI527998809OOOO425')
        expect(iban.validate).to be_falsey
        expect(iban.errors.to_s).to include 'checksum error'
      end
    end

    context 'when iban has no country code' do
      it 'returns not true' do
        iban = described_class.new('89527998809OOOO425')
        expect(iban.validate).to be_falsey
        expect(iban.errors.to_s).to include 'invalid country code'
      end
    end

    context 'when iban has unknown country code' do
      it 'returns not true' do
        iban = described_class.new('XX527998809OOOO425')
        expect(iban.validate).to be_falsey
        expect(iban.errors.to_s).to include 'unknown country code'
      end
    end

    context 'when iban is of wrong length' do
      it 'returns true' do
        iban = described_class.new('FI527998805')
        expect(iban.validate).to be_falsey
        expect(iban.errors.to_s).to include 'length'
      end
    end

    context 'when iban is good' do
      it 'returns true' do
        iban = described_class.new('FI5279988090000425')
        expect(iban.validate).to be(true)
        expect(iban.errors).to be_empty
      end
    end

    context 'when good iban has whitespaces' do
      it 'returns true' do
        iban = described_class.new('FI52 7998 8090 0004 25')
        expect(iban.validate).to be(true)
        expect(iban.errors).to be_empty
      end
    end
  end

  describe '#bic' do
    context 'when iban is empty' do
      it 'returns not true' do
        expect(described_class.new('').bic).to be_falsey
      end
    end

    context 'when iban is malformed' do
      it 'returns not true' do
        # use capital 'o' instead of zero
        expect(described_class.new('FI527998809OOOO425').bic).to be_falsey
      end
    end

    context 'when iban is good' do
      context 'when bic-identification-code is a number' do
        it 'returns BIC' do
          expect(described_class.new('FI5279988090000425').bic).to match('HOLVFIHH')
        end
      end

      context 'when bic-identification-code is a range' do
        it 'returns BIC' do
          expect(described_class.new('FI4447327139000428').bic).to match('POPFFI22')
        end
      end

      context 'when bic-identification-code is comma separated list' do
        it 'returns BIC' do
          expect(described_class.new('FI9639585330009437').bic).to match('SBANFIHH')
        end
      end

      context 'when bic-identification-code is one digit long' do
        it 'returns BIC' do
          expect(described_class.new('FI53 6774 9940 0035 46').bic).to match('AABAFI22')
        end
      end

      context 'when iban is estonian' do
        it 'returns nil' do
          expect(described_class.new('EE112200001107862409').bic).to match('HABAEE2X')
        end
      end

      context 'when iban is from unknown country' do
        it 'returns nil' do
          expect(described_class.new('MD112200001107862409').bic).to be_nil
        end
      end
    end
  end
end
