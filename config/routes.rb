Rails.application.routes.draw do



  devise_for :admins, skip: :registrations
  devise_scope :admin do
    get '/administrator' => 'devise/sessions#new'
  end

  get '/dashboard'                 => 'dashboard#index'
  get '/dashboard/countries'       => 'dashboard#countries',    as: :dashboard_countries
  get '/dashboard/tours'           => 'dashboard#tours',        as: :dashboard_tours
  get '/dashboard/reviews'         => 'dashboard#reviews',      as: :dashboard_reviews
  get '/dashboard/hotels'          => 'dashboard#hotels',       as: :dashboard_hotels
  get '/dashboard/orders'          => 'dashboard#orders',       as: :dashboard_orders
  get '/dashboard/categories'      => 'dashboard#categories',   as: :dashboard_categories
  get '/dashboard/pages'           => 'dashboard#pages',        as: :dashboard_pages
  get '/dashboard/menu'            => 'dashboard#menus',        as: :dashboard_menus
  get '/dashboard/currencies'      => 'dashboard#currencies',   as: :dashboard_currencies
  get '/dashboard/about'           => 'dashboard#about',        as: :dashboard_abouts

  get '/podpiska'                  => 'home_pages#subscribe',   as: :subscribe_page
  resources :home_pages,                                        only: [:index, :edit, :update]

  namespace :dashboard do
    get '/countries/:slug/edit'    => 'countries#edit',         as: :edit_countries
    get '/categories/:slug/edit'   => 'categories#edit',        as: :edit_category

    resources :tours,                                           except: [:index, :show]
    resources :reviews,                                         except: [:index, :show]
    resources :hotels,                                          except: [:index, :show]
    resources :currencies,                                      except: [:index, :show]
    resources :menu_items,                                      except: [:index, :show]
    resources :pages,                                           except: [:index, :show, :edit]
    resources :countries,                                       except: [:index, :show, :edit]
    resources :categories,                                      except: [:index, :show, :edit]
    resources :orders,                                          except: [:index, :show, :edit]
    resources :images,                                          only:   [:create, :destroy]
    resources :configs,                                         only:   [:create, :update, :edit]
    resources :abouts,                                          only:   [:create, :update, :edit]
    resources :admins,                                          only:   [:create, :edit, :update]

    # resources :vacancies
  end

  # Show links
  get '/katalog/:slug' =>'dashboard/categories#show',                   as: :show_category
  get '/strana/:slug'  =>'dashboard/countries#show',                    as: :show_country
  get '/tour/:slug'    =>'dashboard/tours#show',                        as: :show_tour

  get  'dashboard/pages/:slug/edit' => 'dashboard/pages#edit',  as: :edit_dashboard_page
  get  '/:slug' => 'dashboard/pages#show', as: :show_page

  #redirects from old to new correct routes for searching
  get '/otzyvy1',     to: redirect('/otzyvy')
  get '/kontakty1',   to: redirect('/kontakty')
  get '/o-nas1',      to: redirect('/o-nas')

  root 'home_pages#index'
end
