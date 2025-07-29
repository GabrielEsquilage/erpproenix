defmodule Erp.Repo.Migrations.PopulaTiposDocumento do
  use Ecto.Migration
  import Ecto.Query

  alias Erp.Core.TipoDocumento
  alias Erp.Repo

  def up do
    # Define o timestamp atual, truncado para o segundo
    now = DateTime.utc_now() |> DateTime.truncate(:second)

    tipos_documento =
      [
        %{nome: "CPF"},
        %{nome: "CNPJ"},
        %{nome: "RG"}
      ]
      |> Enum.map(&Map.merge(&1, %{inserted_at: now, updated_at: now}))

    Repo.insert_all(TipoDocumento, tipos_documento)
  end

  def down do
    # Remove apenas os dados que esta migração inseriu
    Repo.delete_all(
      from(t in TipoDocumento, where: t.nome in ["CPF", "CNPJ", "RG"])
    )
  end
end
