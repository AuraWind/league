# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

	def event_date(event)
		event_date = event.start_date.to_s
		event_date = (event_date + ' &ndash; ' + event.end_date.to_s) if event.end_date.present?
		return event_date
	end

end
