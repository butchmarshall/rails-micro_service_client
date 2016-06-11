module MicroServiceClient
	module Concerns
		module Controllers
			module Servers
				extend ActiveSupport::Concern

				def create
					MicroServiceServerInstallJob.perform_later(install_params)

					render :nothing => true, :status => 204
				end

				def destroy
					status = 403

					@server = MicroService::Server.where(uninstall_params).first
					if @server && @server.update_attributes(:uninstalled => true)
						status = 204
					end

					render :nothing => true, :status => status
				end

				private
					def json_params
						ActionController::Parameters.new(JSON.parse(request.body.read))
					end

					def uninstall_params
						data = json_params

						data.permit(
							:id,
							:secret,
						)
					end

					def install_params
						data = json_params

						data.permit(
							:client_id,
							:url,
							:secret,
						)
					end
			end
		end
	end
end