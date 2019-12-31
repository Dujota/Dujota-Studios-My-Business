# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  root "blog#index"

  # GraphQL
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  post "/graphql", to: "graphql#execute"

  # USERS & AUTH
  devise_for :users, path_names: {
                       sign_in: "login",
                       sign_out: "logout",
                     }

  # SESSIONS AND REGISTRATIONS
  post "/login" => redirect("/users/login")
  delete "/logout" => redirect("/users/logout")
end
