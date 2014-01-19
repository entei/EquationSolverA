Given(/^user visit new equation page$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^user send valid params$/) do
  page.should have_content 'Result'
end

Then(/^he shoul see result page$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^user send invalid params$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^he should see an error message$/) do
  page.should have_selector('div.alert.alert-danger')
end