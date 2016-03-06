namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "takakimiyajima",
                         email: "takaki.mz@icloud.com",
                         password: "Drumsdrums1",
                         admin: true)

  end
end