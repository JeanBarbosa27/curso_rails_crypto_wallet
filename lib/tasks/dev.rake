namespace :dev do
  desc "Resets setup environment with initial state."
  task reset_setup: :environment do
    if Rails.env.development?
      show_spinner('Droping data base...') { %x(rails db:drop) }
      show_spinner('Creating data base from scratch...') { %x(rails db:create) }
      show_spinner('Migrating data base...') { %x(rails db:migrate) }
      show_spinner('Populating data base...') { %x(rails db:seed) }
    else
      puts 'This command just works at development environment!'
    end
  end


  private
  def show_spinner(start_message, end_message = 'Successfully done!')
    spinner = TTY::Spinner.new("[:spinner] #{start_message}")
    spinner.auto_spin
    yield
    spinner.success("(#{end_message})")
  end
end
