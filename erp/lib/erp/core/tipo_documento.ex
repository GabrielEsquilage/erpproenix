defmodule Erp.Core.TipoDocumento do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tipo_documentos" do
    field(:nome, :string)
    field(:regex, :string)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(tipo_documento, attrs) do
    tipo_documento
    |> cast(attrs, [:nome, :regex])
    |> validate_required([:nome, :regex])
  end
end
