class CreateMediaShares < ActiveRecord::Migration
  def self.up
    create_table :media_shares do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :media_shares
  end
end
