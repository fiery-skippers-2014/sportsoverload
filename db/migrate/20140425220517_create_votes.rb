class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :voteable_type
      t.integer :voteable_id
      t.boolean :vote_type
#CR I think vote_type is up, down - naming is confusing here with
# polymorphism.  Maybe just value.

      t.timestamps
    end
  end
end
