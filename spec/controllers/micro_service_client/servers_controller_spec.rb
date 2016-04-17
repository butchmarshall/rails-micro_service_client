require 'rails_helper'

RSpec.describe MicroServiceClient::ServersController, type: :controller do
	routes { MicroServiceClient::Engine.routes }

	before(:each) do
		@header_params = {
			:CONTENT_TYPE => 'application/json',
			:ACCEPT => 'application/json'
		}
	end

	describe 'POST install' do
		it 'should register a new client with the server' do
			post :create, {
				client_id: 1,
				secret: 123456,
				url: "https://server-service.local"
			}.to_json, @header_params

			# Success
			expect(response.code.to_i).to eq(204)
		end
	end

	describe 'POST uninstall' do
		it 'should unregister an existing client with the server' do
		end
	end
end
