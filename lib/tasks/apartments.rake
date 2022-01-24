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
end
