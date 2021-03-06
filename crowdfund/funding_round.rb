require_relative 'project'
require_relative 'die'
require_relative 'pledge_pool'
require_relative 'fundable'

module FundingRound

  def self.get_funded(project)

    # Funds are randomly added or removed from each project
    die = Die.new
    case die.roll
    when 1 || 3 || 5
      project.remove_funds
    else
      project.add_funds
    end

    # Each project randomly receives a pledge
    # Pledge amounts are tracked in the hash, pledges
    pledge = PledgePool.random
    project.pledge_amount(pledge)
  end

end