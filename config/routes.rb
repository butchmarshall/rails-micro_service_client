MicroServiceClient::Engine.routes.draw do
	# Installs a client on this server
	post 'install' => "servers#create", :as => :install_server
	# Uninstalls a client from this server
	post 'uninstall' => "servers#destroy", :as => :uninstall_server
end
