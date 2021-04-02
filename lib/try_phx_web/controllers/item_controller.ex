defmodule TryPhxWeb.ItemController do
  use TryPhxWeb, :controller

  alias TryPhx.Todo
  alias TryPhx.Todo.Item

  def index(conn, _params) do
    items = Todo.list_items()
    changeset = Todo.change_item(%Item{})
    render(conn, "index.html", items: items, changeset: changeset)
  end

  def new(conn, _params) do
    changeset = Todo.change_item(%Item{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"item" => item_params}) do
    case Todo.create_item(item_params) do
      {:ok, _item} ->
        conn
        |> put_flash(:info, "Item created successfully.")
        |> redirect(to: Routes.item_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    item = Todo.get_item!(id)
    render(conn, "show.html", item: item)
  end

  def edit(conn, %{"id" => id}) do
    item = Todo.get_item!(id)
    changeset = Todo.change_item(item)
    render(conn, "edit.html", item: item, changeset: changeset)
  end

  def update(conn, %{"id" => id, "item" => item_params}) do
    item = Todo.get_item!(id)

    case Todo.update_item(item, item_params) do
      {:ok, _item} ->
        conn
        |> put_flash(:info, "Item updated successfully.")
        |> redirect(to: Routes.item_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", item: item, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    item = Todo.get_item!(id)
    {:ok, _item} = Todo.delete_item(item)

    conn
    |> put_flash(:info, "Item deleted successfully.")
    |> redirect(to: Routes.item_path(conn, :index))
  end
end
