defmodule Erp.Core.Entidade do
  use Ecto.Schema
  import Ecto.Changeset

  schema "entidades" do
    field(:nome_razao_social, :string)
    field(:nome_fantasia_apelido, :string)
    field(:email_principal, :string)
    field(:telefone_principal, :string)
    field(:data_nascimento_fundacao, :date)
    field(:ativo, :boolean, default: false)
    field(:observacoes, :string)

    has_many(:documentos, Erp.Core.Documento)
    belongs_to(:tipo_entidade, Erp.Core.TipoEntidade)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(entidade, attrs) do
    entidade
    |> cast(attrs, [
      :nome_razao_social,
      :nome_fantasia_apelido,
      :email_principal,
      :telefone_principal,
      :data_nascimento_fundacao,
      :ativo,
      :observacoes,
      :tipo_entidade_id
    ])
    |> validate_required([
      :nome_razao_social,
      :nome_fantasia_apelido,
      :email_principal,
      :telefone_principal,
      :data_nascimento_fundacao,
      :tipo_entidade_id
    ])
    |> unique_constraint(:email_principal)
  end
end
