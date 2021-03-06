# frozen_string_literal: true

RailsAdmin.config do |config|
  config.authorize_with do
    redirect_to main_app.root_path unless current_user.user_type == 'admin'
  end

  config.parent_controller = 'ApplicationController'

  config.main_app_name = ['FiscalGang']

  config.model 'User' do
    visible true
    label 'Operatore'
    label_plural 'Operatori'
  end

  config.model 'IseeCard' do
    visible true
    label 'Scheda ISEE'
    label_plural 'Schede ISEE'
  end

  config.model 'IcricPai' do
    visible true
    label 'Scheda ICRIC/PAI'
    label_plural 'Schede ICRIC/PAI'
  end

  config.model 'Location' do
    visible true
    label 'Zona'
    label_plural 'Zone'
  end

  config.model 'UseType' do
    visible true
    label 'Utilizzo'
    label_plural 'Utilizzi'
  end

  config.model 'MessagePriority' do
    visible true
    label 'Priorità'
    label_plural 'Priorità'
  end

  config.model 'Dashboard' do
    visible true
    label 'Messaggio'
    label_plural 'Messaggi'
  end

  config.actions do
    dashboard
    index
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
