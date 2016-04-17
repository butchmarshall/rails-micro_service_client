module MicroServiceClient
	class MicroserviceServerInstallJob < ActiveJob::Base
		queue_as :default

		def perform(*args)
			params = args.extract_options!

			begin
				MicroService::Server.new(params).save
			# Failed to notify the microservice we successfully installed ourselves
			rescue MicroService::Server::InstallError => $e
				# Increment attempt number
				params["attempt"] ||= 1
				params["attempt"] = params["attempt"] + 1

				# Try again in one minute
				MicroserviceServerInstallJob.set(wait: 1.minute).perform_later(params) unless params["attempt"].to_i > 3
			end
		end
	end
end
