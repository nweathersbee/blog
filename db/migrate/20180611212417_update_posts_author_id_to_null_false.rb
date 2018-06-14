class UpdatePostsAuthorIdToNullFalse < ActiveRecord::Migration[5.2]
  def change
    change_column_null :posts, :author_id, false
  end
end
