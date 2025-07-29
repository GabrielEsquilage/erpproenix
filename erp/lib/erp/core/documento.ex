defmodule Erp.Core.Documento do
  use Ecto.Schema
  import Ecto.Changeset

  schema "documentos" do
    field :valor, :string
    field :entidade_id, :id
    field :tipo_documento_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(documento, attrs) do
    documento
    |> cast(attrs, [:valor])
    |> validate_required([:valor])
  end
end
