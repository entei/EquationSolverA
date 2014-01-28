Given(/^user visit new quadratic equation page$/) do
  visit root_path
  click_link "Quadratic equation"
end

When(/^user entered invalid quadric eqation params$/) do
  fill_in 'a', with: ''
  fill_in 'b', with: ''
  fill_in 'c', with: 'c'
end

When(/^user entered params (\-?\d+), (\-?\d+) and (\-?\d+)$/) do |arg1, arg2, arg3|
  fill_in 'a', with: arg1
  fill_in 'b', with: arg2
  fill_in 'c', with: arg3
end

Then(/^he should see result (\-?\d+) and (\-?\d+)$/) do |arg1, arg2|
  page.should have_content(arg1, arg2)
end