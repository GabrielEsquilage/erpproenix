defmodule ErpWeb.TipoDocumentoLive.Show do
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
     |> assign(:tipo_documento, Core.get_tipo_documento!(id))}
  end

  defp page_title(:show), do: "Show Tipo documento"
  defp page_title(:edit), do: "Edit Tipo documento"
end
