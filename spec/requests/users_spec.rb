require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'POST /users' do
    context 'with valid parameters' do
      let(:valid_params) do
        {
          name: 'John Doe',
          mail: 'john.doe@example.com',
          send_due_date_reminder: true,
          due_date_reminder_time: '12:00:00',
          due_date_reminder_interval: 1,
        }
      end

      it 'creates a new user' do
        expect {
          post '/users', params: { user: valid_params }
        }.to change(User, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) do
        {
          name: '',
          mail: 'invalid_email',
        }
      end

      it 'does not create a new user' do
        expect {
          post '/users', params: { user: invalid_params }
        }.not_to change(User, :count)
      end
    end
  end
end