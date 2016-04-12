# Virus Predictor

# I worked on this challenge [with: Anca Ciascaiu].
# We spent [1.25] hours on this challenge.

# EXPLANATION OF require_relative
# Use this term to access files in the same directory as the file you're currently accessing
#
require_relative 'state_data'

class VirusPredictor

  # Initializes each instance with "state", "population", and "population_density" variables
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  # Joins together the results of the private methods
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  private

  # Calculates the number of deaths in a particular state, according to population density
  def predicted_deaths
    # predicted deaths is solely based on population density
    pd = @population_density
    if pd >= 200
      float = 0.4
    elsif pd >= 150
      float = 0.3
    elsif pd >= 100
      float = 0.2
    elsif pd >= 50
      float = 0.1
    else
      float = 0.05
    end
    number_of_deaths = (@population * float).floor
  
    print "#{@state} will lose #{number_of_deaths} people in this outbreak"
  end

  # Calculates speed of spread in a particular state based on population density
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0

    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else
      speed += 2.5
    end
    
    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
alabama.virus_effects

jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
alaska.virus_effects

STATE_DATA.each do |state, population|
  instance = VirusPredictor.new(state, STATE_DATA[state][:population_density], STATE_DATA[state][:population])
  instance.virus_effects
end 

#=======================================================================
# Reflection Section