RSpec.describe NMax::FindNumbersService do

  describe "#initialize" do
    it 'set empty array into @response' do
      expect(app.instance_variable_get(:@text)).to eq 'TestText'
    end
  end
end
