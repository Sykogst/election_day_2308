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
end