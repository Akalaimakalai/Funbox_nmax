RSpec.describe NMax::Application do

  describe "#initialize(text, limit)" do
    let(:app) { NMax::Application.new('TestText', "1") }

    it 'sets text into @text' do
      expect(app.text).to eq 'TestText'
    end

    context 'with valid args' do
      it 'creates new instance' do
        expect(app).to be_is_a(NMax::Application)
      end

      it 'sets limit into @limit' do
        expect(app.limit).to eq '1'
      end
    end

    context 'with invalid limit' do
      context 'limit is not a string' do
        it 'does not create new instance' do
          expect { NMax::Application.new('TestText', {}) }.to raise_error(NMax::Application::Errors::Str::InvalidClass)
        end
      end

      context 'limit is zero' do
        it 'does not create new instance' do
          expect { NMax::Application.new('TestText', '0') }.to raise_error(NMax::Application::Errors::Num::Zero)
        end
      end

      context 'limit is subzero' do
        it 'does not create new instance' do
          expect { NMax::Application.new('TestText', '-1') }.to raise_error(NMax::Application::Errors::Num::Negative)
        end
      end
    end
  end
end
