module PledgesHelper
	def pledge_radio_description(reward)
		text  = " $#{reward.value}+"
		text += "<p>#{reward.description}</p>"
		text += "<p><strong>Estimated delivery:</strong> #{reward.estimated_delivery}</p>"
		text.html_safe
	end
end
