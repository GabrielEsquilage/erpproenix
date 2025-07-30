defmodule Erp.Core.TipoEntidadeDocumento do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tipo_entidade_documentos" do
    belongs_to(:tipo_entidade, Erp.Core.TipoEntidade)
    belongs_to(:tipo_documento, Erp.Core.TipoDocumento)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(ted, attrs) do
    ted
    |> cast(attrs, [:tipo_entidade_id, :tipo_documento_id])
    |> validate_required([:tipo_entidade_id, :tipo_documento_id])
    |> unique_constraint([:tipo_entidade_id, :tipo_documento_id])
  end
end
