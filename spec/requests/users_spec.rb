require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe 'POST #create' do
    before { post :create }

    # Notice that we have to assert have_http_status on the response here...
    it { expect(response).to have_http_status(:success) }
    # ...but we do not have to provide a subject for render_template
    # it { should render_template('index') }
  end
end
