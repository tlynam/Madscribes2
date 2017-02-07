defmodule Madscribes2.Router do
  use Madscribes2.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Madscribes2 do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/registrations", RegistrationController, only: [:new, :create]

    get    "/login",  SessionController, :new
    post   "/login",  SessionController, :create
    delete "/logout", SessionController, :delete

    resources "/stories", StoryController
    resources "/sentences", SentenceController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Madscribes2 do
  #   pipe_through :api
  # end
end
