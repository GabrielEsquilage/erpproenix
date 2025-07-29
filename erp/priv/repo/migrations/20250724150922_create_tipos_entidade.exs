defmodule Erp.Repo.Migrations.CreateTiposEntidade do
  use Ecto.Migration

  def change do
    create table(:tipos_entidade) do
      add :nome, :string
      add :parent_id, references(:tipos_entidade, on_delete: :nilify_all)

      timestamps(type: :utc_datetime)
    end

    create unique_index(:tipos_entidade, [:nome])
    create index(:tipos_entidade, [:parent_id])
  end
end
