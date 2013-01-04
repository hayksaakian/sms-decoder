xml.instruct!
xml.Response do
	if @bad == false
		xml.Sms '== '+@result
	elsif @bad == true
		xml.Sms 'sonic says... that\'s *nogood*'
	end
end