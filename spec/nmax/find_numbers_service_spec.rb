RSpec.describe NMax::FindNumbersService do

  let(:service) { NMax::FindNumbersService.new }

  describe "#initialize" do

    it 'sets empty array into @response' do
      expect(service.instance_variable_get(:@response)).to eq []
    end

    it 'sets @counter to 0' do
      expect(service.instance_variable_get(:@counter)).to eq 0
    end

    it 'creates String.new with length 1000 and sets it into @number' do
      expect(service.instance_variable_get(:@number)).to be_is_a(String)
      expect(service.instance_variable_get(:@number).length).to eq 1000
    end
  end

  describe "#find_in(text)" do
    let(:text) { File.open('spec/support/test_file.txt') }

    describe 'with invalid text' do
      context 'text is not from a stream' do
        it 'raises Str::InvalidClass error' do
          expect { service.find_in('InvalidText') }.to raise_error(NMax::IOValidate::Errors::IO::InvalidClass)
        end
      end
    end

    describe 'with valid text' do
      context 'text with correct numbers' do

        it 'returns correct array' do
          expect(service.find_in(text)).to eq [111, 22, 3, 0, 34, 21, 42]
        end
      end

      context 'text with number longer than 1000 signs' do

        it 'raises Num::TooLongNumber error' do
          service.instance_variable_set(:@counter, 1000)
          expect{ service.find_in(text) }.to raise_error(NMax::FindNumbersService::Errors::Num::TooLongNumber)
        end
      end

      context 'text without numbers' do
        let(:text) { File.open('spec/support/no_numbers.txt') }

        it 'returns empty array' do
          expect(service.find_in(text)).to eq []
        end
      end
    end
  end
end
