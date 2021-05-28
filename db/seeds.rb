# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

initial_coins = [
  {
    coin_name: 'Bitcoin',
    acronym: 'BTC',
    image_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRewQoPbineQHwaypFEwjsWZ_2IsEtc5UWEGtjvryuxJqFngZsfSq4lbPEbrubaUeuW_T0&usqp=CAU'
  },
  {
    coin_name: 'Ethereum',
    acronym: 'ETH',
    image_url: 'https://tl.vhv.rs/dpng/s/420-4206472_fork-cryptocurrency-ethereum-bitcoin-classic-png-download-ethereum.png'
  },
  {
    coin_name: 'Dash',
    acronym: 'DASH',
    image_url: 'https://seeklogo.com/images/D/dash-logo-4A14989CF5-seeklogo.com.png'
  }
]

spinner = TTY::Spinner.new('[:spinner] Starting coin register...')
spinner.auto_spin
initial_coins.each do |coin|
  Coin.find_or_create_by!(coin)
end
spinner.success('Coins registers successfully done!')
