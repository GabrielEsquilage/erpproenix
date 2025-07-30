defmodule Erp.Core.Documento do
  use Ecto.Schema
  import Ecto.Changeset

  schema "documentos" do
    field(:valor, :string)

    belongs_to(:entidade, Erp.Core.Entidade)
    belongs_to(:tipo_documento, Erp.Core.Entidade)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(documento, attrs) do
    documento
    |> cast(attrs, [:valor, :entidade_id, :tipo_documento_id])
    |> validate_required([:valor, :entidade_id, :tipo_document_id])
    |> unique_constraint([:valor, :tipo_documento_id])
  end
end
