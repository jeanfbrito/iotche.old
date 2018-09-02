# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#                     feeds GET    /feeds(.:format)                                                                         feeds#index
#                           POST   /feeds(.:format)                                                                         feeds#create
#                  new_feed GET    /feeds/new(.:format)                                                                     feeds#new
#                 edit_feed GET    /feeds/:id/edit(.:format)                                                                feeds#edit
#                      feed GET    /feeds/:id(.:format)                                                                     feeds#show
#                           PATCH  /feeds/:id(.:format)                                                                     feeds#update
#                           PUT    /feeds/:id(.:format)                                                                     feeds#update
#                           DELETE /feeds/:id(.:format)                                                                     feeds#destroy
#                           POST   /insert/:write_key(.:format)                                                             readings#insert
#           device_readings GET    /devices/:device_id/readings(.:format)                                                   readings#index
#                           POST   /devices/:device_id/readings(.:format)                                                   readings#create
#        new_device_reading GET    /devices/:device_id/readings/new(.:format)                                               readings#new
#       edit_device_reading GET    /devices/:device_id/readings/:id/edit(.:format)                                          readings#edit
#            device_reading GET    /devices/:device_id/readings/:id(.:format)                                               readings#show
#                           PATCH  /devices/:device_id/readings/:id(.:format)                                               readings#update
#                           PUT    /devices/:device_id/readings/:id(.:format)                                               readings#update
#                           DELETE /devices/:device_id/readings/:id(.:format)                                               readings#destroy
#                   devices GET    /devices(.:format)                                                                       devices#index
#                           POST   /devices(.:format)                                                                       devices#create
#                new_device GET    /devices/new(.:format)                                                                   devices#new
#               edit_device GET    /devices/:id/edit(.:format)                                                              devices#edit
#                    device GET    /devices/:id(.:format)                                                                   devices#show
#                           PATCH  /devices/:id(.:format)                                                                   devices#update
#                           PUT    /devices/:id(.:format)                                                                   devices#update
#                           DELETE /devices/:id(.:format)                                                                   devices#destroy
#                      root GET    /                                                                                        dashboard#index
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  resources :feeds
  post '/insert/:write_key' => 'readings#insert'
  resources :devices do
    resources :readings
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'dashboard#index'
end
