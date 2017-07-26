class AddColumnCommentCountToRestaurant < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :comments_count, :integer, :default => 0
    Restaurant.pluck(:id).each do |i|
      Restaurant.reset_counters(i, :comments) # 全部重算一次
    end
  end
end
