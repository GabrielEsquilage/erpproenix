defmodule ErpWeb.TipoEntidadeLive.FormComponent do
  use ErpWeb, :live_component

  alias Erp.CadastroGeral

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>Use this form to manage tipo_entidade records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="tipos_entidade-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:nome]} type="text" label="Nome" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Tipo de entidade</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{tipo_entidade: tipo_entidade} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(CadastroGeral.change_tipos_entidade(tipo_entidade))
     end)}
  end

  @impl true
  def handle_event("validate", %{"tipo_entidade" => tipo_entidade_params}, socket) do
    changeset = CadastroGeral.change_tipos_entidade(socket.assigns.tipo_entidade, tipo_entidade_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"tipo_entidade" => tipo_entidade_params}, socket) do
    save_tipo_entidade(socket, socket.assigns.action, tipo_entidade_params)
  end

  defp save_tipo_entidade(socket, :edit, tipo_entidade_params) do
    case CadastroGeral.update_tipos_entidade(socket.assigns.tipo_entidade, tipo_entidade_params) do
      {:ok, tipo_entidade} ->
        notify_parent({:saved, tipo_entidade})

        {:noreply,
         socket
         |> put_flash(:info, "Tipo de entidade updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_tipo_entidade(socket, :new, tipo_entidade_params) do
    case CadastroGeral.create_tipos_entidade(tipo_entidade_params) do
      {:ok, tipo_entidade} ->
        notify_parent({:saved, tipo_entidade})

        {:noreply,
         socket
         |> put_flash(:info, "Tipo de entidade created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end