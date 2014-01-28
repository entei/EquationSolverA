Given(/^user visit new linear equation page$/) do
  visit root_path
  click_link 'Linear equation'
end

When(/^user entered (\d+)$/) do |arg1, arg2|
  fill_in 'a', with: arg1
  fill_in 'b', with: arg2
end

When(/^user entered params (\-?\d+) and (\-?\d+)$/) do |arg1, arg2|
  fill_in 'a', with: arg1
  fill_in 'b', with: arg2
end

When(/^user entered invalid params$/) do
  fill_in 'a', with: ''
  fill_in 'b', with: 'qwerty'
end

When(/^user click 'Solve'$/) do
  click_button 'Solve'
end

Then(/^he should see result (\-?\d+)$/) do |arg1|
  page.should have_content('Answer')
  page.should have_content(arg1)
end

Then(/^he should see result Divide by zero!$/) do
  page.should have_content('Divide by zero!')
end

Then(/^he should see an error message$/) do
  page.should have_content("Error: fields can't be blank!")
end