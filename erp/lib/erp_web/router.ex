defmodule ErpWeb.Router do
  use ErpWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_live_flash)
    plug(:put_root_layout, html: {ErpWeb.Layouts, :root})
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", ErpWeb do
    pipe_through(:browser)

    get("/", PageController, :home)

    live("/entidades", EntidadeLive.Index, :index)
    live("/entidades/new", EntidadeLive.Index, :new)
    live("/entidades/:id/edit", EntidadeLive.Index, :edit)
    live("/entidades/:id", EntidadeLive.Show, :show)
    live("/entidades/:id/show/edit", EntidadeLive.Show, :edit)

    live("/tipos_entidade", TipoEntidadeLive.Index, :index)
    live("/tipos_entidade/new", TipoEntidadeLive.Index, :new)
    live("/tipos_entidade/:id/edit", TipoEntidadeLive.Index, :edit)

    live("/tipos_entidade/:id", TipoEntidadeLive.Show, :index)
    live("/tipos_entidade/:id/show/edit", TipoEntidadeLive.Show, :edit)
  end

  # Other scopes may use custom stacks.
  # scope "/api", ErpWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:erp, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through(:browser)

      live_dashboard("/dashboard", metrics: ErpWeb.Telemetry)
      forward("/mailbox", Plug.Swoosh.MailboxPreview)
    end
  end
end
