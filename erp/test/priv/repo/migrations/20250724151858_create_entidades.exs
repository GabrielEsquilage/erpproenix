defmodule Erp.Repo.Migrations.CreateEntidades do
  use Ecto.Migration

  def change do
    create table(:entidades) do
      add :nome_razao_social, :string
      add :nome_fantasia_apelido, :string
      add :email_principal, :string
      add :telefone_principal, :string
      add :data_nascimento_fundacao, :date
      add :ativo, :boolean, default: true, null: false
      add :observacoes, :text
      add :tipo_entidade_id, references(:tipos_entidade, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create unique_index(:entidades, [:email_principal])
    create index(:entidades, [:tipo_entidade_id])
  end
end
