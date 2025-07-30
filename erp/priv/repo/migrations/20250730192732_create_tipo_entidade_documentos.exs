defmodule Erp.Repo.Migrations.CreateTipoEntidadeDocumentos do
  use Ecto.Migration

  def change do
    create table(:tipo_entidade_documentos) do
      add :tipo_entidade_id, references(:tipos_entidade, on_delete: :nothing)
      add :tipo_documento_id, references(:tipos_documento, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:tipo_entidade_documentos, [:tipo_entidade_id])
    create index(:tipo_entidade_documentos, [:tipo_documento_id])
  end
end
