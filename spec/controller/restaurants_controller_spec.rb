require "rails_helper"

RSpec.describe RestaurantsController, type: :controller do
  render_views

  describe "GET dashboard" do
    it "check we have user count info in view template" do
      # part 1
      user = create(:user)
      sign_in user
      user_count = rand(20..100)
      allow(User).to receive(:get_user_count).and_return(user_count)

      # part 2
      get :dashboard
      expect(assigns(:user_count)).to eq(user_count)
      expect(response.body).to have_content("There are totally #{user_count} users in this website.")
    end
  end
end
