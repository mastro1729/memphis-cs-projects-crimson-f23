# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :vendors
  devise_for :customers

  # Defines the root path route ("/")
  root to:'candles#index'

  get '/candles', to: 'candles#index', as: 'candles'
  get '/candles/new', to: 'candles#new', as: 'new_candle'
  post '/candles', to: 'candles#create'
  get '/candles/:id/edit', to: 'candles#edit', as: 'edit_candle'
  get '/candles/:id', to: 'candles#show', as: 'candle'
  patch '/candles/:id', to: 'candles#update', as: 'update_candle'
  delete '/candles/:id', to: 'candles#destroy'

  get '/cart_items', to: 'cart_items#index', as: 'cart_items'
  post '/cart_items', to: 'cart_items#createorincrease', as: 'create_cart_item'
  post '/cart_items/increase', to: 'cart_items#createorincrease', as: 'increase_cart_item'
  post '/cart_items/decrease', to: 'cart_items#decrease', as: 'decrease_cart_item'  

  get '/search_filter', to: 'search_filter#index', as: 'search_filter'

  get '/payment_details', to: 'payments#index', as: 'payment_details'
  get '/payment_details/new', to: 'payments#new', as: 'new_payment_detail'
  post '/payment_details', to: 'payments#create_new_payment'
  get '/payment_details/:id/edit', to: 'payments#edit', as: 'edit_payment_detail'
  patch '/payment_details/:id', to: 'payments#update', as: 'update_payment_detail'
  delete '/payment_details', to: 'payments#destroy', as: 'delete_payment_detail'

  get '/reminders', to: 'reminders#index', as: 'reminders'
  post '/reminders', to: 'reminders#create'
  get '/reminders/new', to: 'reminders#new', as: 'new_reminder'
  patch '/reminders/:id/ack', to: 'reminders#acknowledge', as: 'acknowledge_reminder'
  get '/reminders/:id/edit', to: 'reminders#edit', as: 'edit_reminder'
  patch '/reminders/:id', to: 'reminders#update', as: 'reminder'
  delete '/reminders/:id', to: 'reminders#destroy'

  get '/order_confirmation', to: 'orders#order_confirmation', as: 'order_confirmation'
  post '/create_order', to: 'orders#create_order', as: 'create_order'
  get '/order_summary/:id', to: 'orders#order_summary', as: 'order_summary'
  get '/all_orders', to: 'orders#vendor_order_details', as: 'all_orders'
  get '/my_orders', to: 'orders#customer_order_details', as: 'my_orders'

  patch '/orders/:id/delivered', to: 'orders#is_delivered', as: 'is_delivered'
  patch '/orders/:id/cancelled', to: 'orders#cancel_customer_order', as: 'cancelled'
  
end
