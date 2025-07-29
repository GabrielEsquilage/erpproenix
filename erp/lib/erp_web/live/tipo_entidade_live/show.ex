defmodule ErpWeb.TipoEntidadeLive.Show do
  use ErpWeb, :live_view

  alias Erp.CadastroGeral

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:tipo_entidade, CadastroGeral.get_tipos_entidade!(id))}
  end

  defp page_title(:show), do: "Show Tipo de entidade"
  defp page_title(:edit), do: "Edit Tipo de entidade"
end