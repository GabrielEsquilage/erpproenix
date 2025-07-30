defmodule Erp.CadastroGeral.Documento do
  use Ecto.Schema
  import Ecto.Changeset

  schema "documentos" do
    field :valor, :string
    field :principal, :boolean, default: false
    field :validado, :boolean, default: false
    field :entidade_id, :id
    field :tipo_documento_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(documento, attrs) do
    documento
    |> cast(attrs, [:valor, :principal, :validado])
    |> validate_required([:valor, :principal, :validado])
  end
end
