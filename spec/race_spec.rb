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
      expect(@race.instance_variable_get(:@open)).to be true
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

  describe '#open?' do
    it 'returns bool whether or not race is open or not, default true' do
      expect(@race.open?).to be true
    end
  end

  describe '#close!' do
    it 'closes the race' do
      expect(@race.open?).to be true
      @race.close!
      expect(@race.open?).to be false

      @race.close!
      expect(@race.open?).to be false
    end
  end

  describe '#winner' do
    before(:each) do
      @candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
      @candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})
      @candidate3 = @race.register_candidate!({name: "Sam T", party: :democrat})
      @candidate4 = @race.register_candidate!({name: "Sarah R", party: :republican})
    end

    it 'only returns result if race is closed' do
      expect(@race.open?).to be true
      expect(@race.winner).to be false

      1.times { @candidate1.vote_for! }
      2.times { @candidate2.vote_for! }
      4.times { @candidate3.vote_for! }
    
      @race.close!
      expect(@race.open?).to be false
      
      expect(@race.winner).to eq(@candidate3)
    end
  end
end