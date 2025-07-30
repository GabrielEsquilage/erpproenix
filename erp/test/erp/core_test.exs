defmodule Erp.CoreTest do
  use Erp.DataCase

  alias Erp.Core

  describe "tipos_entidade" do
    alias Erp.Core.TipoEntidade

    import Erp.CoreFixtures

    @invalid_attrs %{" nome": nil}

    test "list_tipos_entidade/0 returns all tipos_entidade" do
      tipo_entidade = tipo_entidade_fixture()
      assert Core.list_tipos_entidade() == [tipo_entidade]
    end

    test "get_tipo_entidade!/1 returns the tipo_entidade with given id" do
      tipo_entidade = tipo_entidade_fixture()
      assert Core.get_tipo_entidade!(tipo_entidade.id) == tipo_entidade
    end

    test "create_tipo_entidade/1 with valid data creates a tipo_entidade" do
      valid_attrs = %{" nome": "some  nome"}

      assert {:ok, %TipoEntidade{} = tipo_entidade} = Core.create_tipo_entidade(valid_attrs)
      assert tipo_entidade. nome == "some  nome"
    end

    test "create_tipo_entidade/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_tipo_entidade(@invalid_attrs)
    end

    test "update_tipo_entidade/2 with valid data updates the tipo_entidade" do
      tipo_entidade = tipo_entidade_fixture()
      update_attrs = %{" nome": "some updated  nome"}

      assert {:ok, %TipoEntidade{} = tipo_entidade} = Core.update_tipo_entidade(tipo_entidade, update_attrs)
      assert tipo_entidade. nome == "some updated  nome"
    end

    test "update_tipo_entidade/2 with invalid data returns error changeset" do
      tipo_entidade = tipo_entidade_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_tipo_entidade(tipo_entidade, @invalid_attrs)
      assert tipo_entidade == Core.get_tipo_entidade!(tipo_entidade.id)
    end

    test "delete_tipo_entidade/1 deletes the tipo_entidade" do
      tipo_entidade = tipo_entidade_fixture()
      assert {:ok, %TipoEntidade{}} = Core.delete_tipo_entidade(tipo_entidade)
      assert_raise Ecto.NoResultsError, fn -> Core.get_tipo_entidade!(tipo_entidade.id) end
    end

    test "change_tipo_entidade/1 returns a tipo_entidade changeset" do
      tipo_entidade = tipo_entidade_fixture()
      assert %Ecto.Changeset{} = Core.change_tipo_entidade(tipo_entidade)
    end
  end

  describe "tipos_documento" do
    alias Erp.Core.TipoDocumento

    import Erp.CoreFixtures

    @invalid_attrs %{" nome": nil}

    test "list_tipos_documento/0 returns all tipos_documento" do
      tipo_documento = tipo_documento_fixture()
      assert Core.list_tipos_documento() == [tipo_documento]
    end

    test "get_tipo_documento!/1 returns the tipo_documento with given id" do
      tipo_documento = tipo_documento_fixture()
      assert Core.get_tipo_documento!(tipo_documento.id) == tipo_documento
    end

    test "create_tipo_documento/1 with valid data creates a tipo_documento" do
      valid_attrs = %{" nome": "some  nome"}

      assert {:ok, %TipoDocumento{} = tipo_documento} = Core.create_tipo_documento(valid_attrs)
      assert tipo_documento. nome == "some  nome"
    end

    test "create_tipo_documento/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_tipo_documento(@invalid_attrs)
    end

    test "update_tipo_documento/2 with valid data updates the tipo_documento" do
      tipo_documento = tipo_documento_fixture()
      update_attrs = %{" nome": "some updated  nome"}

      assert {:ok, %TipoDocumento{} = tipo_documento} = Core.update_tipo_documento(tipo_documento, update_attrs)
      assert tipo_documento. nome == "some updated  nome"
    end

    test "update_tipo_documento/2 with invalid data returns error changeset" do
      tipo_documento = tipo_documento_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_tipo_documento(tipo_documento, @invalid_attrs)
      assert tipo_documento == Core.get_tipo_documento!(tipo_documento.id)
    end

    test "delete_tipo_documento/1 deletes the tipo_documento" do
      tipo_documento = tipo_documento_fixture()
      assert {:ok, %TipoDocumento{}} = Core.delete_tipo_documento(tipo_documento)
      assert_raise Ecto.NoResultsError, fn -> Core.get_tipo_documento!(tipo_documento.id) end
    end

    test "change_tipo_documento/1 returns a tipo_documento changeset" do
      tipo_documento = tipo_documento_fixture()
      assert %Ecto.Changeset{} = Core.change_tipo_documento(tipo_documento)
    end
  end

  describe "entidades" do
    alias Erp.Core.Entidade

    import Erp.CoreFixtures

    @invalid_attrs %{nome_razao_social: nil, nome_fantasia_apelido: nil, email_principal: nil, telefone_principal: nil, data_nascimento_fundacao: nil, ativo: nil, observacoes: nil}

    test "list_entidades/0 returns all entidades" do
      entidade = entidade_fixture()
      assert Core.list_entidades() == [entidade]
    end

    test "get_entidade!/1 returns the entidade with given id" do
      entidade = entidade_fixture()
      assert Core.get_entidade!(entidade.id) == entidade
    end

    test "create_entidade/1 with valid data creates a entidade" do
      valid_attrs = %{nome_razao_social: "some nome_razao_social", nome_fantasia_apelido: "some nome_fantasia_apelido", email_principal: "some email_principal", telefone_principal: "some telefone_principal", data_nascimento_fundacao: ~D[2025-07-23], ativo: true, observacoes: "some observacoes"}

      assert {:ok, %Entidade{} = entidade} = Core.create_entidade(valid_attrs)
      assert entidade.nome_razao_social == "some nome_razao_social"
      assert entidade.nome_fantasia_apelido == "some nome_fantasia_apelido"
      assert entidade.email_principal == "some email_principal"
      assert entidade.telefone_principal == "some telefone_principal"
      assert entidade.data_nascimento_fundacao == ~D[2025-07-23]
      assert entidade.ativo == true
      assert entidade.observacoes == "some observacoes"
    end

    test "create_entidade/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_entidade(@invalid_attrs)
    end

    test "update_entidade/2 with valid data updates the entidade" do
      entidade = entidade_fixture()
      update_attrs = %{nome_razao_social: "some updated nome_razao_social", nome_fantasia_apelido: "some updated nome_fantasia_apelido", email_principal: "some updated email_principal", telefone_principal: "some updated telefone_principal", data_nascimento_fundacao: ~D[2025-07-24], ativo: false, observacoes: "some updated observacoes"}

      assert {:ok, %Entidade{} = entidade} = Core.update_entidade(entidade, update_attrs)
      assert entidade.nome_razao_social == "some updated nome_razao_social"
      assert entidade.nome_fantasia_apelido == "some updated nome_fantasia_apelido"
      assert entidade.email_principal == "some updated email_principal"
      assert entidade.telefone_principal == "some updated telefone_principal"
      assert entidade.data_nascimento_fundacao == ~D[2025-07-24]
      assert entidade.ativo == false
      assert entidade.observacoes == "some updated observacoes"
    end

    test "update_entidade/2 with invalid data returns error changeset" do
      entidade = entidade_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_entidade(entidade, @invalid_attrs)
      assert entidade == Core.get_entidade!(entidade.id)
    end

    test "delete_entidade/1 deletes the entidade" do
      entidade = entidade_fixture()
      assert {:ok, %Entidade{}} = Core.delete_entidade(entidade)
      assert_raise Ecto.NoResultsError, fn -> Core.get_entidade!(entidade.id) end
    end

    test "change_entidade/1 returns a entidade changeset" do
      entidade = entidade_fixture()
      assert %Ecto.Changeset{} = Core.change_entidade(entidade)
    end
  end

  describe "documentos" do
    alias Erp.Core.Documento

    import Erp.CoreFixtures

    @invalid_attrs %{valor: nil}

    test "list_documentos/0 returns all documentos" do
      documento = documento_fixture()
      assert Core.list_documentos() == [documento]
    end

    test "get_documento!/1 returns the documento with given id" do
      documento = documento_fixture()
      assert Core.get_documento!(documento.id) == documento
    end

    test "create_documento/1 with valid data creates a documento" do
      valid_attrs = %{valor: "some valor"}

      assert {:ok, %Documento{} = documento} = Core.create_documento(valid_attrs)
      assert documento.valor == "some valor"
    end

    test "create_documento/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_documento(@invalid_attrs)
    end

    test "update_documento/2 with valid data updates the documento" do
      documento = documento_fixture()
      update_attrs = %{valor: "some updated valor"}

      assert {:ok, %Documento{} = documento} = Core.update_documento(documento, update_attrs)
      assert documento.valor == "some updated valor"
    end

    test "update_documento/2 with invalid data returns error changeset" do
      documento = documento_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_documento(documento, @invalid_attrs)
      assert documento == Core.get_documento!(documento.id)
    end

    test "delete_documento/1 deletes the documento" do
      documento = documento_fixture()
      assert {:ok, %Documento{}} = Core.delete_documento(documento)
      assert_raise Ecto.NoResultsError, fn -> Core.get_documento!(documento.id) end
    end

    test "change_documento/1 returns a documento changeset" do
      documento = documento_fixture()
      assert %Ecto.Changeset{} = Core.change_documento(documento)
    end
  end

  describe "tipo_documentos" do
    alias Erp.Core.TipoDocumento

    import Erp.CoreFixtures

    @invalid_attrs %{nome: nil, regex: nil}

    test "list_tipo_documentos/0 returns all tipo_documentos" do
      tipo_documento = tipo_documento_fixture()
      assert Core.list_tipo_documentos() == [tipo_documento]
    end

    test "get_tipo_documento!/1 returns the tipo_documento with given id" do
      tipo_documento = tipo_documento_fixture()
      assert Core.get_tipo_documento!(tipo_documento.id) == tipo_documento
    end

    test "create_tipo_documento/1 with valid data creates a tipo_documento" do
      valid_attrs = %{nome: "some nome", regex: "some regex"}

      assert {:ok, %TipoDocumento{} = tipo_documento} = Core.create_tipo_documento(valid_attrs)
      assert tipo_documento.nome == "some nome"
      assert tipo_documento.regex == "some regex"
    end

    test "create_tipo_documento/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_tipo_documento(@invalid_attrs)
    end

    test "update_tipo_documento/2 with valid data updates the tipo_documento" do
      tipo_documento = tipo_documento_fixture()
      update_attrs = %{nome: "some updated nome", regex: "some updated regex"}

      assert {:ok, %TipoDocumento{} = tipo_documento} = Core.update_tipo_documento(tipo_documento, update_attrs)
      assert tipo_documento.nome == "some updated nome"
      assert tipo_documento.regex == "some updated regex"
    end

    test "update_tipo_documento/2 with invalid data returns error changeset" do
      tipo_documento = tipo_documento_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_tipo_documento(tipo_documento, @invalid_attrs)
      assert tipo_documento == Core.get_tipo_documento!(tipo_documento.id)
    end

    test "delete_tipo_documento/1 deletes the tipo_documento" do
      tipo_documento = tipo_documento_fixture()
      assert {:ok, %TipoDocumento{}} = Core.delete_tipo_documento(tipo_documento)
      assert_raise Ecto.NoResultsError, fn -> Core.get_tipo_documento!(tipo_documento.id) end
    end

    test "change_tipo_documento/1 returns a tipo_documento changeset" do
      tipo_documento = tipo_documento_fixture()
      assert %Ecto.Changeset{} = Core.change_tipo_documento(tipo_documento)
    end
  end
end
