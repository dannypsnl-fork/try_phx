defmodule TryPhx.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :text, :string

      timestamps()
    end

  end
end
