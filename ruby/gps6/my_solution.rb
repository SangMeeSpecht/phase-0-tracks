# Virus Predictor

# I worked on this challenge [with: Anca Ciascaiu].
# We spent [1.25] hours on this challenge.

# EXPLANATION OF require_relative
# Accesses files in the same directory as the file you're currently accessing
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
    pd = @population_density
    speed_rate = speed

    if pd >= 200
      speed_rate = 0.5
    elsif pd >= 150
      speed_rate = 1
    elsif pd >= 100
      speed_rate = 1.5
    elsif pd >= 50
      speed_rate = 2
    else
      speed_rate = 2.5
    end

    speed += speed_rate
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
=begin
*What are the differences between the two different hash syntaxes shown in the state_data file?
One hash uses the rocket hash symbol to assign the value and the other hash uses the symbol method
to assign the value ( => vs. : ).


*What does require_relative do? How is it different from require?
'require_relative' includes a file into the current file, but only if it's in the same directory as
the current file.  'require' does the same, but for files that aren't in the same directory as the 
current file.  To include that file, you would have to write the relative path after 'require,' which 
you don't have to do for 'require relative'.


*What are some ways to iterate through a hash?
The "each" method is the most common way to iterate through a hash.  The "collect" method also works.  


*When refactoring virus_effects, what stood out to you about the variables, if anything?
The variables are instance variables.  With the help of our guide, we discovered that it's
redundant to include those as arguments and parameteres because the private instance methods have 
access to those instance variables via the initialize method.


*What concept did you most solidify in this challenge?
Two concepts are the power of instance variables and scope.  Another important lesson learned is
to always try to see how you can refactor.  These methods look like they don't need refactoring, 
but there was room for improvement for each one.   

=end
