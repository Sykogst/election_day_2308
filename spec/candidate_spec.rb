require './lib/candidate'

RSpec.describe Candidate do
  before(:each) do
    @diana = Candidate.new({name: "Diana D", party: :democrat})
  end

  describe '#initialization' do
    it 'can have instance' do
      expect(@diana).to be_instance_of(Candidate)
    end

    it 'has attributes upon initialization' do
      expect(@diana.name).to eq('Diana D')
      expect(@diana.party).to eq(:democrat)
      expect(@diana.votes).to eq(0)
    end
  end

  describe '#vote_for!' do
    it "increments the vote count" do
      expect(@diana.votes).to eq(0)

      3.times {@diana.vote_for!}
      expect(@diana.votes).to eq(3)

      @diana.vote_for!
      expect(@diana.votes).to eq(4)
    end
  end
end
