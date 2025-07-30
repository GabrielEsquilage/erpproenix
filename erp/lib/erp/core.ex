defmodule Erp.Core do
  @moduledoc """
  The Core context.
  """

  import Ecto.Query, warn: false
  alias Erp.Repo

  alias Erp.Core.TipoEntidade
  alias Erp.Core.TipoDocumento
  alias Erp.Core.Entidade
  alias Erp.Core.Documento

  # TIPOS ENTIDADE

  def list_tipos_entidade do
    Repo.all(TipoEntidade)
  end

  def get_tipo_entidade!(id), do: Repo.get!(TipoEntidade, id)

  def create_tipo_entidade(attrs \\ %{}) do
    %TipoEntidade{}
    |> TipoEntidade.changeset(attrs)
    |> Repo.insert()
  end

  def update_tipo_entidade(%TipoEntidade{} = tipo_entidade, attrs) do
    tipo_entidade
    |> TipoEntidade.changeset(attrs)
    |> Repo.update()
  end

  def delete_tipo_entidade(%TipoEntidade{} = tipo_entidade) do
    Repo.delete(tipo_entidade)
  end

  def change_tipo_entidade(%TipoEntidade{} = tipo_entidade, attrs \\ %{}) do
    TipoEntidade.changeset(tipo_entidade, attrs)
  end

  # TIPOS DOCUMENTO

  def list_tipos_documento do
    Repo.all(TipoDocumento)
  end

  def get_tipo_documento!(id), do: Repo.get!(TipoDocumento, id)

  def create_tipo_documento(attrs \\ %{}) do
    %TipoDocumento{}
    |> TipoDocumento.changeset(attrs)
    |> Repo.insert()
  end

  def update_tipo_documento(%TipoDocumento{} = tipo_documento, attrs) do
    tipo_documento
    |> TipoDocumento.changeset(attrs)
    |> Repo.update()
  end

  def delete_tipo_documento(%TipoDocumento{} = tipo_documento) do
    Repo.delete(tipo_documento)
  end

  def change_tipo_documento(%TipoDocumento{} = tipo_documento, attrs \\ %{}) do
    TipoDocumento.changeset(tipo_documento, attrs)
  end

  # ENTIDADES

  def list_entidades(params \\ %{}) do
    query = from(e in Entidade, preload: [:tipo_entidade])

    query =
      case Map.get(params, "tipo_entidade_id") do
        nil ->
          query

        "" ->
          query

        tipo_id_string ->
          try do
            tipo_id = String.to_integer(tipo_id_string)
            where(query, [e], e.tipo_entidade_id == ^tipo_id)
          rescue
            _ -> query
          end
      end

    Repo.all(query)
  end

  def get_entidade!(id), do: Repo.get!(Entidade, id)

  def get_entidade_with_documents!(id) do
    Entidade
    |> Repo.get!(id)
    |> Repo.preload(:documentos)
  end

  def create_entidade(attrs \\ %{}) do
    %Entidade{}
    |> Entidade.changeset(attrs)
    |> Repo.insert()
  end

  def update_entidade(%Entidade{} = entidade, attrs) do
    entidade
    |> Entidade.changeset(attrs)
    |> Repo.update()
  end

  def delete_entidade(%Entidade{} = entidade) do
    Repo.delete(entidade)
  end

  def change_entidade(%Entidade{} = entidade, attrs \\ %{}) do
    Entidade.changeset(entidade, attrs)
  end

  # DOCUMENTOS

  def list_documentos do
    Repo.all(Documento)
  end

  def get_documento!(id), do: Repo.get!(Documento, id)

  def create_documento(attrs \\ %{}) do
    %Documento{}
    |> Documento.changeset(attrs)
    |> Repo.insert()
  end

  def update_documento(%Documento{} = documento, attrs) do
    documento
    |> Documento.changeset(attrs)
    |> Repo.update()
  end

  def delete_documento(%Documento{} = documento) do
    Repo.delete(documento)
  end

  def change_documento(%Documento{} = documento, attrs \\ %{}) do
    Documento.changeset(documento, attrs)
  end
end
