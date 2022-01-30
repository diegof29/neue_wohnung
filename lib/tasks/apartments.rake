# frozen_string_literal: true

namespace :apartments do
  task get_new: :environment do
    GetNewApartments.new.call
  end
end

namespace :telegram do 
  task send_message: :environment do
    SendTelegramMessage.new.call(ENV.fetch("TELEGRAM_CHAT_ID"), "Diego test message")
  end
  
  task notify_first_apartment: :environment do 
    first_receiver = Receiver.find(1)
    first_apartment = Apartment.find(1)
    NotifyAboutApartment.new.call(first_receiver, first_apartment)
  end

  task notify_last_apartment_all_receivers: :environment do 
    last_apartment = Apartment.last 
    notify_about_apartment = NotifyAboutApartment.new
    Receiver.all.each do |receiver|
      notify_about_apartment.call(receiver, last_apartment)
    end
  end
end
