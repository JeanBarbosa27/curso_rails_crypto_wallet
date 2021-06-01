namespace :dev do
  desc 'Resets setup environment with initial state.'
  task reset_setup: :environment do
    if Rails.env.development?
      show_spinner('Droping data base...') { %x(`rails db:drop`) }
      show_spinner('Creating data base from scratch...') { %x(`rails db:create`) }
      show_spinner('Migrating data base...') { %x(`rails db:migrate`) }
      %x(`rails dev:add_mining_types`)
      %x(`rails dev:add_coins`)
    else
      puts 'This command just works at development environment!'
    end
  end

  desc "Creates new coins if it isn't exist yet"
  task add_coins: :environment do
    initial_coins = [
      {
        coin_name: 'Bitcoin',
        acronym: 'BTC',
        image_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRewQoPbineQHwaypFEwjsWZ_2IsEtc5UWEGtjvryuxJqFngZsfSq4lbPEbrubaUeuW_T0&usqp=CAU',
        mining_type: MiningType.find_by(acronym: 'PoW')
      },
      {
        coin_name: 'Ethereum',
        acronym: 'ETH',
        image_url: 'https://tl.vhv.rs/dpng/s/420-4206472_fork-cryptocurrency-ethereum-bitcoin-classic-png-download-ethereum.png',
        mining_type: MiningType.all.sample
      },
      {
        coin_name: 'Dash',
        acronym: 'DASH',
        image_url: 'https://seeklogo.com/images/D/dash-logo-4A14989CF5-seeklogo.com.png',
        mining_type: MiningType.all.sample
      }
    ]

    show_spinner('Creating initial coins...') do
      initial_coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Creates new mining types if it isn't exist yet"
  task add_mining_types: :environment do
    initial_mining_types = [
      { type_name: 'Proof of Work', acronym: 'PoW' },
      { type_name: 'Proof of Stake', acronym: 'PoS' },
      { type_name: 'Proof of Capacity', acronym: 'PoC' }
    ]

    show_spinner('Creating inital mining types...') do
      initial_mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
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
