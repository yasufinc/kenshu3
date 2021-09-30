require 'rails_helper'

RSpec.describe TweetsController, type: :request do
  before do
    allow(TweetsController.new).to receive(:current_user).and_return(user)
  end

  describe "GET /tweets" do
    subject { get '/tweets' }

    let(:user) { create(:user, name: 'yasuyasu') }

    context 'when user is signed_in' do
      before do
        sign_in user
      end

      it 'returns 200' do
        subject
        expect(response.status).to eq 200
      end
    end

    context 'when user is not signed_in' do
      it 'returns 302' do
        subject
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "POST /tweet" do
    subject { post url, params: params }

    let(:url) { '/tweets' }

    let(:params) do
      {
        tweet: {
          user_id: 1,
          content: content,
          publicity: :everybody
        }
      }
    end

    let(:user) { create(:user) } 

    before do
      sign_in user
    end

    context 'when normal case' do
      let(:content) { 'Hi!' }

      it 'returns 302' do
        subject
        expect(response).to redirect_to(tweets_path)
      end
    end

    context 'when content is null' do
      let(:content) { nil }
      
      it 'returns 200' do
        subject
        expect(response.status).to eq 200
      end
    end
  end

  describe "PATCH /tweet/:id" do
    subject { patch url, params: params }

    let(:user) { create(:user) } 

    let(:params) do
      {
        tweet: {
          content: 'hi Yasu!',
          publicity: :everybody
        }
      }
    end

    before do
      sign_in user
    end

    context 'when tweet exsits' do
      let(:url) { "/tweets/#{tweet.id}" }
      let(:tweet) { create(:tweet, user: user) }

      it 'returns 302' do
        subject
        expect(response).to redirect_to(tweets_path)
      end
    end

    context 'when tweet does not exist' do
      let(:url) { "/tweets/1000000" }

      it 'returns 302' do
        subject
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "DELETE /tweet/:id" do
    subject { delete url, params: params }

    let(:user) { create(:user) } 

    let(:params) do
      {
        tweet: {
          content: 'hi Yasu!',
          publicity: :everybody
        }
      }
    end

    before do
      sign_in user
    end

    context 'when tweet exsits' do
      let(:url) { "/tweets/#{tweet.id}" }
      let(:tweet) { create(:tweet, user: user) }

      it 'returns 302' do
        subject
        expect(response).to redirect_to(tweets_path)
      end
    end

    context 'when tweet does not exist' do
      let(:url) { "/tweets/1000000" }

      it 'returns 302' do
        subject
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
