require 'rails_helper'

RSpec.feature 'post feature', type: :feature do
  before (:each) do
    visit '/posts'
    click_link('New Post')
    fill_post('Grace first post','I wanna be shaonainai')
  end

  def fill_post(title, content)
    fill_in('post_title', with: title)
    fill_in('post_content', with: content)
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
    fill_post('Grace second post','I wanna be dev')
    click_button('Update Post')
    expect(page).to have_content('Post was successfully updated.')
  end
end
