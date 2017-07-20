class NotificationController < ApplicationController
	def notify
        #get all devices registered in our db and loop through each of them
		Device.all.each do |device|
			n = Rpush::Gcm::Notification.new
            # use the pushme_droid app we previously registered in our initializer file to send the notification
			n.app = Rpush::Gcm::App.find_by_name("pushme_droid")
			n.registration_ids = [device.token]

            # parameter for the notification
			n.notification = {
				body: 'Just wanted to tell you that you are beautiful!',
		       	title: 'Hey this is rpush from rails!',
		       	sound: 'default'
	     	}
            #save notification entry in the db
			n.save!
		end

        # send all notifications stored in db
        Rpush.push

		render json: {sent: true}, status: :ok
	end
end