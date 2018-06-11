class RenameSlugToDomain < ActiveRecord::Migration[5.1]
  def change
    rename_column :recipe_sources, :slug, :domain
  end
end
