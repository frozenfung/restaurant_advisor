namespace :dev do

  desc "Rebuild system"
  task :rebuild => ["db:drop", "db:setup", :fake]

  task :fake => :environment do
      puts "Create fake data for development"
      u = User.new( :email => "root@example.com", :password => "password", :role => "admin")
      u.save!
  end
end
