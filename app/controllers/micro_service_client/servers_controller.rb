require_dependency "micro_service_client/application_controller"

module Concerns
	module Controllers
		module Servers
			extend MicroServiceClient::Concerns::Controllers::Servers
		end
	end
end

module MicroServiceClient
	class ServersController < ApplicationController
		include Concerns::Controllers::Servers
	end
end
