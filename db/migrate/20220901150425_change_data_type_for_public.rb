class ChangeDataTypeForPublic < ActiveRecord::Migration[7.0]
  def self.up
    change_table :recipes do |t|
      t.change :public, :string
    end
  end
  def self.down
    change_table :recipes do |t|
      t.change :public, :boolean
    end
  end
end
