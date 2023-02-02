Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  resources :weather_reports, only: :show

  scope :weather do
    get :current, to: 'weather_reports#current'
    get :historical, to: 'weather_reports#historical'
    get 'historical/max', to: 'weather_reports#historical_max'
    get 'historical/min', to: 'weather_reports#historical_min'
    get 'historical/avg', to: 'weather_reports#historical_avg'
    get :by_time, to: 'weather_reports#by_time', param: :timestamp
  end

  get :health, to: 'application#health'

  root 'application#health'
end
