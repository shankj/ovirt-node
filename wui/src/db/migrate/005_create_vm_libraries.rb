class CreateVmLibraries < ActiveRecord::Migration
  def self.up
    create_table :vm_libraries do |t|
      t.column :name,                       :string
      t.column :host_collection_id,         :integer, :null => false
    end
    execute "alter table vm_libraries add constraint fk_libraries_hw_pools
             foreign key (host_collection_id) references hardware_pools(id)"
  end

  def self.down
    drop_table :vm_libraries
  end
end
