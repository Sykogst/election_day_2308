class Race
  attr_reader :office, :candidates
  # One param, office candidates are running for
  # default empty candidates array to contain candidate instances
  def initialize(office)
    @office = office
    @candidates = []
  end
end