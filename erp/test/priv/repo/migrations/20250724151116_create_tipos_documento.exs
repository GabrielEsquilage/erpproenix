defmodule Erp.Repo.Migrations.CreateTiposDocumento do
  use Ecto.Migration

  def change do
    create table(:tipos_documento) do
      add :nome, :string
      timestamps(type: :utc_datetime)
    end

    create unique_index(:tipos_documento, [:nome])
  end
end
