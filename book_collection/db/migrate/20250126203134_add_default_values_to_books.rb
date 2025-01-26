class AddDefaultValuesToBooks < ActiveRecord::Migration[6.1]
  def up
    Book.where(author: nil).update_all(author: 'none')
    Book.where(price: nil).update_all(price: 0.99)
    Book.where(publisheddate: nil).update_all(publisheddate: '2000-01-02')
  end

  def down
    Book.where(author: 'none').update_all(author: nil)
    Book.where(price: 0.99).update_all(price: nil)
    Book.where(publisheddate: '2000-01-02').update_all(publisheddate: nil)
  end
end
