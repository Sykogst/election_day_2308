class Candidate
  attr_reader :name, :party, :votes
  # one parameter: hash with :name, :party
  # one default: votes, 0
  def initialize(candidate_info)
    @name = candidate_info[:name]
    @party = candidate_info[:party]
    @votes = 0
  end

  def vote_for!
    @votes += 1
  end
end