require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe Election do
  before(:each) do
    @election_2023 = Election.new('2023')

    @race_tx_gov = Race.new("Texas Governor")
    @race_co_gov = Race.new("Colorado Governor")

    @candidate1 = @race_tx_gov.register_candidate!({name: "Diana D", party: :democrat})
    @candidate2 = @race_tx_gov.register_candidate!({name: "Roberto R", party: :republican})

    @candidate3 = @race_co_gov.register_candidate!({name: "Sam T", party: :democrat})
    @candidate4 = @race_co_gov.register_candidate!({name: "Sarah R", party: :republican})
  end

  describe '#initialize' do
    it 'can have instance' do
      expect(@election_2023).to be_instance_of(Election)
    end

    it 'has attributes upon initialization' do 
      # String election year
      expect(@election_2023.year).to eq('2023')
      # Array of race objects
      expect(@election_2023.races).to eq([])
      expect(@election_2023.year).to eq('2023')
    end
  end

  describe '#add_race' do
    it 'adds a race to races' do
      expect(@election_2023.races).to eq([])

      @election_2023.add_race(@race_tx_gov)
      expect(@election_2023.races).to eq([@race_tx_gov])

      @election_2023.add_race(@race_co_gov)
      expect(@election_2023.races).to eq([@race_tx_gov, @race_co_gov])
    end
  end

  describe '#candidates' do
    it 'returns array of all Candidate objects' do
      expect(@election_2023.candidates).to eq([])

      @election_2023.add_race(@race_tx_gov)
      expect(@election_2023.candidates).to eq([@candidate1, @candidate2])

      @election_2023.add_race(@race_co_gov)
      expect(@election_2023.candidates).to eq([@candidate1, @candidate2, @candidate3, @candidate4])
    end
  end

  describe '#vote_counts' do
    it 'returns has with candidate name and vote count' do
      @election_2023.add_race(@race_tx_gov)
      expect(@election_2023.vote_counts).to eq({@candidate1.name => 0, @candidate2.name => 0})

      @election_2023.add_race(@race_co_gov)
      expect(@election_2023.vote_counts).to eq({@candidate1.name => 0, @candidate2.name => 0, @candidate3.name => 0, @candidate4.name => 0})
      
      @candidate1.vote_for!
      4.times {@candidate4.vote_for!}
      expect(@election_2023.vote_counts).to eq({@candidate1.name => 1, @candidate2.name => 0, @candidate3.name => 0, @candidate4.name => 0})
    end
  end
end