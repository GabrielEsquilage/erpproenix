defmodule ErpWeb.TipoDocumentoLiveTest do
  use ErpWeb.ConnCase

  import Phoenix.LiveViewTest
  import Erp.CoreFixtures

  @create_attrs %{nome: "some nome", regex: "some regex"}
  @update_attrs %{nome: "some updated nome", regex: "some updated regex"}
  @invalid_attrs %{nome: nil, regex: nil}

  defp create_tipo_documento(_) do
    tipo_documento = tipo_documento_fixture()
    %{tipo_documento: tipo_documento}
  end

  describe "Index" do
    setup [:create_tipo_documento]

    test "lists all tipo_documentos", %{conn: conn, tipo_documento: tipo_documento} do
      {:ok, _index_live, html} = live(conn, ~p"/tipo_documentos")

      assert html =~ "Listing Tipo documentos"
      assert html =~ tipo_documento.nome
    end

    test "saves new tipo_documento", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/tipo_documentos")

      assert index_live |> element("a", "New Tipo documento") |> render_click() =~
               "New Tipo documento"

      assert_patch(index_live, ~p"/tipo_documentos/new")

      assert index_live
             |> form("#tipo_documento-form", tipo_documento: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#tipo_documento-form", tipo_documento: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/tipo_documentos")

      html = render(index_live)
      assert html =~ "Tipo documento created successfully"
      assert html =~ "some nome"
    end

    test "updates tipo_documento in listing", %{conn: conn, tipo_documento: tipo_documento} do
      {:ok, index_live, _html} = live(conn, ~p"/tipo_documentos")

      assert index_live |> element("#tipo_documentos-#{tipo_documento.id} a", "Edit") |> render_click() =~
               "Edit Tipo documento"

      assert_patch(index_live, ~p"/tipo_documentos/#{tipo_documento}/edit")

      assert index_live
             |> form("#tipo_documento-form", tipo_documento: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#tipo_documento-form", tipo_documento: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/tipo_documentos")

      html = render(index_live)
      assert html =~ "Tipo documento updated successfully"
      assert html =~ "some updated nome"
    end

    test "deletes tipo_documento in listing", %{conn: conn, tipo_documento: tipo_documento} do
      {:ok, index_live, _html} = live(conn, ~p"/tipo_documentos")

      assert index_live |> element("#tipo_documentos-#{tipo_documento.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#tipo_documentos-#{tipo_documento.id}")
    end
  end

  describe "Show" do
    setup [:create_tipo_documento]

    test "displays tipo_documento", %{conn: conn, tipo_documento: tipo_documento} do
      {:ok, _show_live, html} = live(conn, ~p"/tipo_documentos/#{tipo_documento}")

      assert html =~ "Show Tipo documento"
      assert html =~ tipo_documento.nome
    end

    test "updates tipo_documento within modal", %{conn: conn, tipo_documento: tipo_documento} do
      {:ok, show_live, _html} = live(conn, ~p"/tipo_documentos/#{tipo_documento}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Tipo documento"

      assert_patch(show_live, ~p"/tipo_documentos/#{tipo_documento}/show/edit")

      assert show_live
             |> form("#tipo_documento-form", tipo_documento: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#tipo_documento-form", tipo_documento: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/tipo_documentos/#{tipo_documento}")

      html = render(show_live)
      assert html =~ "Tipo documento updated successfully"
      assert html =~ "some updated nome"
    end
  end
end
