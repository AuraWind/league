# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

	def event_date(event)
		event_date = event.start_at.to_s
		event_date = (event_date.to_s + ' &ndash; ' + event.end_at.to_s) if event.end_at.present?
		return event_date
	end

end
