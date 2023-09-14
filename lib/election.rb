class Election
  attr_reader :year, :races
  def initialize(year)
    @year = year
    @races = []
  end

  def add_race(race)
    @races << race
  end

  def candidates
    @races.flat_map { |race| race.candidates }
  end

  def vote_counts
    candidate_votes = {}
    # I dont like how I did this
    candidates_all = candidates
    candidates_all.each do |candidate|
      candidate_votes[candidate.name] = candidate.votes
    end
    candidate_votes
  end
end