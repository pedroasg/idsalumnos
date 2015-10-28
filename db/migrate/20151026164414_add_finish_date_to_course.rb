class AddFinishDateToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :finish_date, :datetime
  end
end
