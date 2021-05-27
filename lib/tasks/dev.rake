namespace :dev do
  desc "Resets setup environment with initial state."
  task reset_setup: :environment do
    if Rails.env.development?
      puts %x(rails db:drop)
      puts %x(rails db:create)
      puts %x(rails db:migrate)
      puts %x(rails db:seed)
    else
      puts 'This command just works at development environment!'
    end
  end

end
