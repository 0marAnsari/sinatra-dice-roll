require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')



get "/" do
  '<h1>Dice Roll</h1>
  
    <ul>
      <li><a href = "/dice/2/6">Roll two 6-sided Dice</a></li>
      <li><a href = "/dice/2/10">Roll two 10-sided Dice</a></li>
      <li><a href = "/dice/1/20">Roll one 20-sided Dice</a></li>
      <li><a href = "/dice/5/4">Roll five 4-sided Dice</a></li>
    </ul>
    '
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server"
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  "<h1>Two 6-sided Dice</h1>
  <p>#{outcome}</p>"
end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

 "<h1>Two 10-sided Dice</h1>
  <p>#{outcome}</p>"
end


get("/dice/1/20") do
  one_die = rand(1..20)
  
  outcome = "You rolled a #{one_die} for a total sum of #{one_die}"

  "<h1>One 20-sided Die</h1>
  <p>#{outcome}</p>"
end

get("/dice/5/4") do
  first_die = rand(1..4)
  second_die = rand(1..4)
  third_die = rand(1..4) 
  fourth_die = rand(1..4)
  fifth_die = rand(1..4)
  sum = first_die + second_die + third_die + fourth_die + fifth_die

  outcome = "You rolled a #{first_die}, #{second_die}, #{third_die}, #{fourth_die}, #{fifth_die} for a total of #{sum}"

  "<h1>Five 4-Sided Dice</h1>
  <p>#{outcome}</p>"

end
