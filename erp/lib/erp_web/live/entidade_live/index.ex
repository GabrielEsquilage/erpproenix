defmodule ErpWeb.EntidadeLive.Index do
  use ErpWeb, :live_view

  alias Erp.Core
  alias Erp.Core.Entidade
  alias Erp.Repo

  @impl true
  def mount(_params, _session, socket) do
    tipos_entidade = Core.list_tipos_entidade()
    filter = %{"tipo_entidade_id" => ""}

    socket =
      socket
      |> assign(
        tipos_entidade: tipos_entidade,
        filter: filter,
        filter_form: to_form(filter, as: :filter),
        entidades: Core.list_entidades()
      )

    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  @impl true
  def handle_event("filter", %{"filter" => params}, socket) do
    entidades = Core.list_entidades(params)

    socket =
      socket
      |> assign(
        filter: params,
        filter_form: to_form(params, as: :filter),
        entidades: entidades
      )

    {:noreply, socket}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Editar Entidade")
    |> assign(:entidade, Core.get_entidade!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "Cadastrar Nova Entidade")
    |> assign(:entidade, %Entidade{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listando Entidades")
    |> assign(:entidade, nil)
  end

  @impl true
  def handle_info({ErpWeb.EntidadeLive.FormComponent, {:saved, entidade}}, socket) do
    entidade = Repo.preload(entidade, :tipo_entidade)
    {:noreply, stream_insert(socket, :entidades, entidade)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    entidade = Core.get_entidade!(id)
    {:ok, _} = Core.delete_entidade(entidade)

    {:noreply, stream_delete(socket, :entidades, entidade)}
  end
end
