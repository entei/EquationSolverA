Given(/^a user visit home page$/) do
  visit root_path
end

When(/^he clicks linear equation button$/) do
  click_link "Linear equation"
end

Then(/^he should see new linear equation form$/) do
  page.should have_selector('h1', text: 'New linear equation')
end

When(/^he clicks quadratic equation button$/) do
  click_link "Quadratic equation"
end

Then(/^he should see new quadratic equation form$/) do
  #page.should have_content
  page.should have_selector('h1', text: 'New quadratic equation')
end
