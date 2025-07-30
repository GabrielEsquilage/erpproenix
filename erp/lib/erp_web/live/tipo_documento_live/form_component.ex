defmodule ErpWeb.TipoDocumentoLive.FormComponent do
  use ErpWeb, :live_component

  alias Erp.Core

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>Use this form to manage tipo_documento records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="tipo_documento-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:nome]} type="text" label="Nome" />
        <.input field={@form[:regex]} type="text" label="Regex" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Tipo documento</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{tipo_documento: tipo_documento} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Core.change_tipo_documento(tipo_documento))
     end)}
  end

  @impl true
  def handle_event("validate", %{"tipo_documento" => tipo_documento_params}, socket) do
    changeset = Core.change_tipo_documento(socket.assigns.tipo_documento, tipo_documento_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"tipo_documento" => tipo_documento_params}, socket) do
    save_tipo_documento(socket, socket.assigns.action, tipo_documento_params)
  end

  defp save_tipo_documento(socket, :edit, tipo_documento_params) do
    case Core.update_tipo_documento(socket.assigns.tipo_documento, tipo_documento_params) do
      {:ok, tipo_documento} ->
        notify_parent({:saved, tipo_documento})

        {:noreply,
         socket
         |> put_flash(:info, "Tipo documento updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_tipo_documento(socket, :new, tipo_documento_params) do
    case Core.create_tipo_documento(tipo_documento_params) do
      {:ok, tipo_documento} ->
        notify_parent({:saved, tipo_documento})

        {:noreply,
         socket
         |> put_flash(:info, "Tipo documento created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
