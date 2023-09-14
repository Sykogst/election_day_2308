class Race
  attr_reader :office, :candidates
  # One param, office candidates are running for
  # default empty candidates array to contain candidate instances
  def initialize(office)
    @office = office
    @candidates = []
    @open = true
  end

  def register_candidate!(candidate_info)
    new_candidate = Candidate.new(candidate_info)
    @candidates << new_candidate
    new_candidate
  end

  def open?
    @open
  end

  def close!
    @open = false
  end

  def winner
    vote_counts = @candidates.map { |candidate| candidate.votes }
    num_winners = vote_counts.length - vote_counts.uniq.length + 1
    !open? ? @candidates.max_by(num_winners) { |candidate| candidate.votes } : false
  end

  def tie?
    true if winner.length > 1
  end
end