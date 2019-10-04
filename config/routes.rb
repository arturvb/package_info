Rails.application.routes.draw do
  get "/package/health/:packagename/:version" => "packages#health"
  get "/package/health/:packagename" => "packages#health"
  get "/package/releases/:packagename" => "packages#releases"
end
