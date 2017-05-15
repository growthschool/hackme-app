namespace :dev do

  task :fake => :environment do
    User.delete_all
    Event.delete_all
    Comment.delete_all

    users = []
    users << User.create!( :email => "admin@example.org", :password => "12345678", :role => "admin" )
    users << User.create!( :email => "hacker@example.org", :password => "12345678" )
    users << User.create!( :email => "ihower@gmail.com", :password => "12345678" )

    10.times do |i|
      event = Event.create!( :name => Faker::Cat.name,
                             :description => Faker::Lorem.paragraph,
                             :user_id => users.sample.id )
      puts "Generate Event #{i}"
      10.times do |j|
        event.comments.create!( :user_id => users.sample.id, :content => Faker::Lorem.paragraph )
      end
    end

    products = []
    10.times do
      products << Product.create!( :title => Faker::Commerce.product_name,
                       :description => Faker::Lorem.paragraph,
                       :price => ( rand(100)+1 ) * 10 )
    end

    users.size.times do
      cart = Cart.create
      cart.add_product_to_cart( products.sample )
      cart.add_product_to_cart( products.sample )
      cart.add_product_to_cart( products.sample )
    end

  end

end