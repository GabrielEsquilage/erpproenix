defmodule Erp.Repo.Migrations.RemoveParentIdFromTiposEntidade do
  use Ecto.Migration

  def up do
    # É importante remover primeiro o índice que depende da coluna.
    drop index(:tipos_entidade, [:parent_id])

    # Em seguida, removemos a coluna. O Ecto também removerá a chave estrangeira.
    alter table(:tipos_entidade) do
      remove :parent_id
    end
  end

  def down do
    # Para reverter, adicionamos a coluna com a referência novamente.
    alter table(:tipos_entidade) do
      add :parent_id, references(:tipos_entidade, on_delete: :nilify_all)
    end

    # E recriamos o índice.
    create index(:tipos_entidade, [:parent_id])
  end
end