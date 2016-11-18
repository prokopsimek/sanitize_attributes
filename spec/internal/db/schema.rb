ActiveRecord::Schema.define version: 0 do
  create_table :sanitizable_models, force: true do |t|
    t.column :name, :string
    t.column :short_description, :text
    t.column :long_description, :text
  end
end