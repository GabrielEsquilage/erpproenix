defmodule ErpWeb.TipoEntidadeLive.Index do
  use ErpWeb, :live_view

  alias Erp.CadastroGeral
  alias Erp.CadastroGeral.TipoEntidade

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :tipos_entidade, CadastroGeral.list_tipos_entidade())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Tipo de entidade")
    |> assign(:tipo_entidade, CadastroGeral.get_tipos_entidade!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Tipo de entidade")
    |> assign(:tipo_entidade, %TipoEntidade{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Tipos de entidade")
    |> assign(:tipo_entidade, nil)
  end

  @impl true
  def handle_info({ErpWeb.TipoEntidadeLive.FormComponent, {:saved, tipo_entidade}}, socket) do
    {:noreply, stream_insert(socket, :tipos_entidade, tipo_entidade)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    tipo_entidade = CadastroGeral.get_tipos_entidade!(id)
    {:ok, _} = CadastroGeral.delete_tipos_entidade(tipo_entidade)

    {:noreply, stream_delete(socket, :tipos_entidade, tipo_entidade)}
  end
end