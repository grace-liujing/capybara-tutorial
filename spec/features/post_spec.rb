require 'rails_helper'

RSpec.feature 'post feature', type: :feature do

  let(:post_title){'my first post'}
  let(:post_content){'I wanna be rich'}
  let(:update_title){'my second post'}

  scenario 'post process' do
    visit '/posts'
    on_page_with :post_list, :top_10_post, :post do |page|
        expect(page.posts_in_list.length).to eq(0)
        page.perform :new_a_post
        page.perform :fill_post, post_title, post_content
        page.perform :back_to_home
        expect(page.posts_in_list.length).to eq(0)

        page.perform :new_a_post
        page.perform :fill_post, post_title, post_content
        page.perform :create_post
        expect(page.notice_message).to eq('Post was successfully created.')
        page.perform :back_to_home
        expect(page.posts_in_list.length).to eq(1)
        expect(page.top_10_list_item).to have_content(post_title)

        page.perform :edit_post
        page.perform :fill_post, update_title, post_content
        page.perform :update_post
        expect(page.notice_message).to eq('Post was successfully updated.')
        page.perform :back_to_home
        expect(page.posts_in_list.length).to eq(1)
        expect(page.top_10_list_item).to have_content(update_title)

        page.perform :destroy_post
        expect(page.notice_message).to eq('Post was successfully destroyed.')
        expect(page.posts_in_list.length).to eq(0)
    end
  end
end
