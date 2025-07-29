defmodule Erp.Core.TipoDocumento do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tipos_documento" do
    field :nome, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(tipo_documento, attrs) do
    tipo_documento
    |> cast(attrs, [:nome])
    |> validate_required([:nome])
    |> unique_constraint(:nome)
  end
end
