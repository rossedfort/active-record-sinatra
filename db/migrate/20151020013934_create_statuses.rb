class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.text :name
    end
  end
end
