module AccountsHelper

	def money_format(amount, unit='$', display_free=false)
		return '' unless amount.is_a?(Numeric)
		return 'Free' if amount <= 0 && display_free
		number_to_currency(amount, :unit => unit)
	end

end
