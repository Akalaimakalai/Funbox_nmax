RSpec.describe NMax::Application do
  let(:text) { File.open('spec/support/test_file.txt') }
  let(:app) { NMax::Application.new(text, "3") }

  describe "#initialize(text, limit)" do

    it 'sets text into @text' do
      expect(app.instance_variable_get(:@text)).to eq text
    end

    context 'with valid args' do
      it 'creates new instance' do
        expect(app).to be_is_a(NMax::Application)
      end

      it 'sets limit into @limit' do
        expect(app.instance_variable_get(:@limit)).to eq 3
      end
    end

    context 'with invalid text' do
      context 'text is not from a stream' do
        it 'raises Str::InvalidClass error' do
          expect { NMax::Application.new('invalid text', '1') }.to raise_error(NMax::IOValidate::Errors::IO::InvalidClass)
        end
      end
    end

    context 'with invalid limit' do
      context 'limit is not a string' do
        it 'raises Str::InvalidClass error' do
          expect { NMax::Application.new(text, {}) }.to raise_error(NMax::Application::Errors::Str::InvalidClass)
        end
      end

      context 'limit is zero' do
        it 'raises Lim::Zero error' do
          expect { NMax::Application.new(text, '0') }.to raise_error(NMax::Application::Errors::Lim::Zero)
        end
      end

      context 'limit is subzero' do
        it 'raises Lim::Negative error' do
          expect { NMax::Application.new(text, '-1') }.to raise_error(NMax::Application::Errors::Lim::Negative)
        end
      end
    end
  end

  describe "#call" do
    let(:service) { NMax::FindNumbersService.new }

    it 'creates new instance of FindNumbersService' do
      expect(NMax::FindNumbersService).to receive(:new).and_call_original
      allow(app).to receive(:puts)
      app.call
    end

    it 'calls #find_in service method' do
      allow(NMax::FindNumbersService).to receive(:new).and_return(service)
      expect(service).to receive(:find_in).with(text).and_call_original
      allow(app).to receive(:puts)
      app.call
    end

    it 'puts sorted array' do
      expect(app).to receive(:puts).with([111, 42, 34])
      app.call
    end
  end
end
