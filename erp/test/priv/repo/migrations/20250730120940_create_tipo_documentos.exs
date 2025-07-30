defmodule Erp.Repo.Migrations.CreateTipoDocumentos do
  use Ecto.Migration

  def change do
    create table(:tipo_documentos) do
      add :nome, :string
      add :regex, :string

      timestamps(type: :utc_datetime)
    end
  end
end
