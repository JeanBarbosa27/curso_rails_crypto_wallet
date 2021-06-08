# Methods to help rendering infos in welcome view
module WelcomeHelper
  def format_date_br(us_date_format)
    us_date_format.strftime('%d/%m/%Y')
  end

  def show_language
    I18n.locale == :en ? 'inglês dos Estados Unidos da América' : 'português do Brasil'
  end

  def rails_environment
    environments = {
      production: 'produção',
      development: 'desenvolvimento',
      test: 'teste',
      staging: 'homologação'
    }

    environments[Rails.env.to_sym]
  end
end
