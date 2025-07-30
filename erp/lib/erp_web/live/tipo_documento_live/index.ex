defmodule ErpWeb.TipoDocumentoLive.Index do
  use ErpWeb, :live_view

  alias Erp.Core
  alias Erp.Core.TipoDocumento

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :tipo_documentos, Core.list_tipos_documento())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Tipo documento")
    |> assign(:tipo_documento, Core.get_tipo_documento!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Tipo documento")
    |> assign(:tipo_documento, %TipoDocumento{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Tipo documentos")
    |> assign(:tipo_documento, nil)
  end

  @impl true
  def handle_info({ErpWeb.TipoDocumentoLive.FormComponent, {:saved, tipo_documento}}, socket) do
    {:noreply, stream_insert(socket, :tipo_documentos, tipo_documento)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    tipo_documento = Core.get_tipo_documento!(id)
    {:ok, _} = Core.delete_tipo_documento(tipo_documento)

    {:noreply, stream_delete(socket, :tipo_documentos, tipo_documento)}
  end
end
