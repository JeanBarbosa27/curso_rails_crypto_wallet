namespace :dev do
  desc "Resets setup environment with initial state."
  task reset_setup: :environment do
    if Rails.env.development?
      spinner = TTY::Spinner.new('[:spinner] Droping data base...')
      %x(rails db:drop)
      spinner.success('(Successfully done!)')

      spinner = TTY::Spinner.new('[:spinner] Creating data base from scratch...')
      %x(rails db:create)
      spinner.success('(Successfully done!)')

      spinner = TTY::Spinner.new('[:spinner] Migrating data base...')
      %x(rails db:migrate)
      spinner.success('(Successfully done!)')

      spinner = TTY::Spinner.new('[:spinner] Populating data base...')
      %x(rails db:seed)
      spinner.success('(Successfully done!)')
    else
      puts 'This command just works at development environment!'
    end
  end

end
