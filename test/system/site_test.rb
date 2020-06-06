require 'application_system_test_case'

class SiteTest < ApplicationSystemTestCase
	test 'presence of tooltip'  do
		visit root_url
		el = find('.tooltip')
		page.driver.browser.action.move_to(el.native).perform
		assert has_text?("foo")
	end
end