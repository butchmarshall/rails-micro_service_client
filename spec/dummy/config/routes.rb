Rails.application.routes.draw do

  mount MicroServiceClient::Engine => "/micro_service_client"
end
