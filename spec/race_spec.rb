require './lib/candidate'
require './lib/race'

RSpec.describe Race do
  before(:each) do
    @race = Race.new("Texas Governor")
  end

  describe '#initialize' do
    it 'can have instance' do
      expect(@race).to be_instance_of(Race)
    end

    it 'has attributes upon initialization' do
      expect(@race.office).to eq('Texas Governor')
      expect(@race.candidates).to eq([])
    end
  end

  describe '#register_candidate!' do
    it 'adds candidate information ' do
      candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
      expect(candidate1.class).to eq(Candidate)
      expect(candidate1.name).to eq('Diana D')
      expect(candidate1.party).to eq(:democrat)
      expect(@race.candidates).to eq([candidate1])
    end

    it 'adds more candidate information' do
      candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
      expect(candidate1.class).to eq(Candidate)
      expect(candidate1.name).to eq('Diana D')
      expect(candidate1.party).to eq(:democrat)
      expect(@race.candidates).to eq([candidate1])

      candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})
      expect(candidate2.class).to eq(Candidate)
      expect(candidate2.name).to eq('Roberto R')
      expect(candidate2.party).to eq(:republican)
      expect(@race.candidates).to eq([candidate1, candidate2])
    end
  end
end