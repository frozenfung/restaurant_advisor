namespace :dev do

  desc "Rebuild system"
  task :rebuild => ["db:drop", "db:setup", :fake]

  task :fake => :environment do
      u = User.new( :email => "root@example.com", :password => "password", :role => "admin")
      u.save!
      puts "Create default admin user data for development"
      20.times do
        Restaurant.create!(:name =>FFaker::Name.first_name,
          :opening_hour =>FFaker::Time.date,
          :tel => FFaker::PhoneNumberAU.home_work_phone_number,
          :address =>FFaker::AddressUK.street_address,
          :description => FFaker::Lorem.sentences,
          :image => FFaker::Avatar.image,
          :category_id => rand(7)
          )
      end
      puts "have created fake restaurants"
  end
end
