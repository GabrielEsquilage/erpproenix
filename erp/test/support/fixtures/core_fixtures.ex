defmodule Erp.CoreFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Erp.Core` context.
  """

  @doc """
  Generate a unique tipo_entidade  nome.
  """
  def unique_tipo_entidade_ nome, do: "some  nome#{System.unique_integer([:positive])}"

  @doc """
  Generate a tipo_entidade.
  """
  def tipo_entidade_fixture(attrs \\ %{}) do
    {:ok, tipo_entidade} =
      attrs
      |> Enum.into(%{
         nome: unique_tipo_entidade_ nome()
      })
      |> Erp.Core.create_tipo_entidade()

    tipo_entidade
  end

  @doc """
  Generate a unique tipo_documento  nome.
  """
  def unique_tipo_documento_ nome, do: "some  nome#{System.unique_integer([:positive])}"

  @doc """
  Generate a tipo_documento.
  """
  def tipo_documento_fixture(attrs \\ %{}) do
    {:ok, tipo_documento} =
      attrs
      |> Enum.into(%{
         nome: unique_tipo_documento_ nome()
      })
      |> Erp.Core.create_tipo_documento()

    tipo_documento
  end

  @doc """
  Generate a unique entidade email_principal.
  """
  def unique_entidade_email_principal, do: "some email_principal#{System.unique_integer([:positive])}"

  @doc """
  Generate a entidade.
  """
  def entidade_fixture(attrs \\ %{}) do
    {:ok, entidade} =
      attrs
      |> Enum.into(%{
        ativo: true,
        data_nascimento_fundacao: ~D[2025-07-23],
        email_principal: unique_entidade_email_principal(),
        nome_fantasia_apelido: "some nome_fantasia_apelido",
        nome_razao_social: "some nome_razao_social",
        observacoes: "some observacoes",
        telefone_principal: "some telefone_principal"
      })
      |> Erp.Core.create_entidade()

    entidade
  end

  @doc """
  Generate a documento.
  """
  def documento_fixture(attrs \\ %{}) do
    {:ok, documento} =
      attrs
      |> Enum.into(%{
        valor: "some valor"
      })
      |> Erp.Core.create_documento()

    documento
  end

  @doc """
  Generate a tipo_documento.
  """
  def tipo_documento_fixture(attrs \\ %{}) do
    {:ok, tipo_documento} =
      attrs
      |> Enum.into(%{
        nome: "some nome",
        regex: "some regex"
      })
      |> Erp.Core.create_tipo_documento()

    tipo_documento
  end
end
