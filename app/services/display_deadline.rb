class DisplayDeadline

  attr_reader :matchup

  def initialize(matchup)
    @matchup = matchup
  end

  def competitor_show_display
    matchup.deadline.strftime("%A, %B %d, '%y") +
    " at " +
    matchup.deadline.strftime("%I:%M %p")
  end

end
