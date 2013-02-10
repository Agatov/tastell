module OrderConcerns
  module Smsable
    extend ActiveSupport::Concern

    included do
      attr_accessible :sms_id
    end

    def send_notification
      response = HTTParty.get(
        'http://api.sms24x7.ru',
        query: {
            method: 'push_msg',
            email: 'agatovs@gmail.com',
            password: 'avv6rqE',
            phone: place.phone,
            text: sms_text,
            sender_name: 'tastle'
        }
      )

      if response.parsed_response['response']['msg']['text'] == 'OK'
        update_attributes(sms_id: response.parsed_response['response']['data']['id'])
      else
        false
      end
    end

    def sms_text
      I18n.translate(
          'sms.notifcation_message',
          username: user.first_name,
          table_number: table_number.to_s,
          date: created_at.strftime('%d %b, %H:%M')
      )
    end

  end
end