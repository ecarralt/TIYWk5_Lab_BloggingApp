# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

usernames = ["Tired_Truffles", "sprucetrap87", "DarthContinent", "Otherworldlee", "LukeInTheSkyWith"]

post_titles = [
  "Brexit: David Cameron to quit after UK votes to leave EU",
  "Europe is fed up, it is simmering with rage. What now for the EU?",
  "why are we thinking what we are thinking?",
  "Donald Trump arrives in UK and hails Brexit vote as 'great victory'",
  "Brexit: Jeremy Corbyn under pressure amid top team revolt",
  "Is it ok to allow the mass population to decide?"
]

comments = [
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  "It's better than allowing a small portion of the population to decide for the mass. That's called a Monarchy, or dictatorship. Democracy has done more for minority groups than any other governmental system. Everyone is equal, so the majority should decide. If not, then you are saying some people are more valuable than others.",
  "It's also called a Republic. In the United States, that is the governmental system that ended slavery and gave women the right to vote.",
  "Representatives who represented the majority ended slavery and gave women the right to vote. The majority of people were against slavery, that is why the union army was much larger than the confederate. It's actually an example as to why the majority should decide. The Confederates literally believed they were fighting the tyrannical majority. Women being able to vote was also like this, sans civil war. The majority of people that were for it were the educated city dwellers, those against it were the rural and the uneducated. ",
  "So you believe wars are an example of Democracy working? I've never heard someone suggest that theory before..."
]

vote_counts = [4, 6, 3, 5, 0]

#Create posts
post_titles.each do |title|
  newpost = Post.new
  newpost.title = title
  newpost.username = usernames.sample
  newpost.vote_count = vote_counts.sample
  if newpost.save
    puts "Created post: #{title}"
  else
    puts "DID NOT CREATE post: #{title}"
  end
end


#Create comments
comments.each do |comment|
  newcomment = Comment.new
  newcomment.body = comment
  newcomment.username = usernames.sample
  newcomment.post_id = 6
  if newcomment.save
    puts "Created comment: #{comment}"
  else
    puts "DID NOT CREATE post: #{comment}"
  end
end
