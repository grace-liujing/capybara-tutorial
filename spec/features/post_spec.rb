require 'rails_helper'

RSpec.feature 'post feature', type: :feature do

  scenario 'create new post' do
    visit '/posts'
    on_page_with :post_list, :top_10_post, :new_post do |page|
        expect(page.posts_in_list.length).to eq(0)
        page.perform :new_a_post
        page.perform :fill_post, 'my first post', 'I wanna be the full-stack dev'
        page.perform :back_to_home
        expect(page.posts_in_list.length).to eq(0)

        page.perform :new_a_post
        page.perform :fill_post, 'my first post', 'I wanna be the full-stack dev'
        page.perform :create_post
        expect(page.notice_message).to eq('Post was successfully created.')
        page.perform :back_to_home
        expect(page.posts_in_list.length).to eq(1)
        expect(page.top_10_list_item).to have_content('my first post')
    end
  end
end
