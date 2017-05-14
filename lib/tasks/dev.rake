namespace :dev do

  task :fake => :environment do
    User.delete_all
    Event.delete_all
    Comment.delete_all

    users = []
    users << User.create!( :email => "admin@example.org", :password => "12345678", :role => "admin" )
    users << User.create!( :email => "user1@example.org", :password => "12345678" )
    users << User.create!( :email => "user2@example.org", :password => "12345678" )

    10.times do |i|
      event = Event.create!( :name => Faker::Cat.name,
                             :description => Faker::Lorem.paragraph,
                             :user_id => users.sample.id )
      puts "Generate Event #{i}"
      10.times do |j|
        event.comments.create!( :user_id => users.sample.id, :content => Faker::Lorem.paragraph )
      end
    end
  end

end