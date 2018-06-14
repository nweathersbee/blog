class RemoveArticleFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :posts, :article, index: true, foreign_key: true
  end
end
