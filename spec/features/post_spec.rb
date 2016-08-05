require 'rails_helper'

RSpec.feature 'post feature', type: :feature do
  before (:each) do
    visit '/posts'
    click_link('New Post')
    fill_in('post_title', with: 'Grace first post')
    fill_in('post_content', with: 'I wanna be shaonainai')
  end

  scenario 'not create post if cancel' do
    click_link('Back')
    expect(page).not_to have_content('Grace first post')
  end

  scenario 'create new post successfully' do
    click_button('Create Post')
    expect(page).to have_content('Post was successfully created.')
    visit '/posts'
    expect(page).to have_content('Grace first post')
    expect(page.find('.top-10-container')).to have_content('Grace first post')
  end

  scenario 'edit post successfully' do
    click_button('Create Post')
    click_link('Edit')
    fill_in('post_title', with: 'Grace second post')
    fill_in('post_content', with: 'I wanna be dev')
    click_button('Update Post')
    expect(page).to have_content('Post was successfully updated.')
  end
end
