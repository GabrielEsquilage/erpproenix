defmodule Erp.CadastroGeral.TipoEntidade do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tipos_entidade" do
    field :nome, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(tipo_entidade, attrs) do
    tipo_entidade
    |> cast(attrs, [:nome])
    |> validate_required([:nome])
  end
end