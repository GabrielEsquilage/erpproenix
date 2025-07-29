defmodule ErpWeb.EntidadeLive.FormComponent do
  use ErpWeb, :live_component

  alias Erp.Core
  alias Erp.CadastroGeral

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>Use este formulário para gerenciar os registros de entidade.</:subtitle>
      </.header>

      <.form
        for={@form}
        id="entidade-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <div class="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-6 py-8">
          <%!-- Coluna 1 --%>
          <.input field={@form[:nome_razao_social]} type="text" label="Nome / Razão Social" />
          <.input field={@form[:email_principal]} type="email" label="Email Principal" />
          <.input field={@form[:data_nascimento_fundacao]} type="date" label="Data de Nascimento / Fundação" />

          <%!-- Coluna 2 --%>
          <.input field={@form[:nome_fantasia_apelido]} type="text" label="Nome Fantasia / Apelido" />
          <.input field={@form[:telefone_principal]} type="text" label="Telefone Principal" />
          <.input
            field={@form[:tipo_entidade_id]}
            type="select"
            label="Tipo de entidade"
            prompt="Escolha um tipo"
            options={Enum.map(@tipos_entidade, &{&1.nome, &1.id})}
          />

          <%!-- Linha Completa --%>
          <div class="md:col-span-2">
            <.input field={@form[:observacoes]} type="textarea" label="Observações" />
          </div>

          <div class="md:col-span-2 flex items-center">
            <.input field={@form[:ativo]} type="checkbox" label="Ativo" />
          </div>
        </div>

        <%!-- Ações do Formulário --%>
        <div class="flex justify-end border-t border-gray-200 pt-6">
          <.button phx-disable-with="Salvando..." class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
            Salvar Entidade
          </.button>
        </div>
      </.form>
    </div>
    """
  end

  @impl true
  def update(%{entidade: entidade} = assigns, socket) do
    tipos_entidade = CadastroGeral.list_tipos_entidade()
    changeset = Core.change_entidade(entidade)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:tipos_entidade, tipos_entidade)
     |> assign(form: to_form(changeset), changeset: changeset)}
  end

  @impl true
  def handle_event("validate", %{"entidade" => entidade_params}, socket) do
    changeset =
      Core.change_entidade(socket.assigns.entidade, entidade_params)

    {:noreply, assign(socket, form: to_form(changeset), changeset: changeset)}
  end

  def handle_event("save", %{"entidade" => entidade_params}, socket) do
    save_entidade(socket, socket.assigns.action, entidade_params)
  end

  defp save_entidade(socket, action, entidade_params) do
    {save_function, success_message} =
      case action do
        :edit ->
          {&Core.update_entidade(socket.assigns.entidade, &1), "Entidade atualizada com sucesso"}

        :new ->
          {&Core.create_entidade/1, "Entidade criada com sucesso"}
      end

    case save_function.(entidade_params) do
      {:ok, entidade} ->
        notify_parent({:saved, entidade})

        {:noreply,
         socket
         |> put_flash(:info, success_message)
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
