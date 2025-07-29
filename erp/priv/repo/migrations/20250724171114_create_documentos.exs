defmodule Erp.Repo.Migrations.CreateDocumentos do
  use Ecto.Migration

  def change do
    create table(:documentos) do
      add :valor, :string
      add :entidade_id, references(:entidades, on_delete: :nothing)
      add :tipo_documento_id, references(:tipos_documento, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:documentos, [:entidade_id])
    create index(:documentos, [:tipo_documento_id])
    create index(:documentos, [:valor, :tipo_documento_id], unique: true)
  end
end
