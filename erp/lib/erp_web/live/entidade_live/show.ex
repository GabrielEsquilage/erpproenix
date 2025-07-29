defmodule ErpWeb.EntidadeLive.Show do
  use ErpWeb, :live_view

  alias Erp.Core

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:entidade, Core.get_entidade_with_documents!(id))}
  end

  defp page_title(:show), do: "Detalhes da Entidade"
  defp page_title(:edit), do: "Editar Entidade"
end