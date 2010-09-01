class RenameDocumentFieldFileToDocFile < ActiveRecord::Migration
  def self.up
    rename_column :documents, :file_file_name, :doc_file_name
    rename_column :documents, :file_content_type, :doc_file_name
    rename_column :documents, :file_file_size, :doc_file_name
    rename_column :documents, :file_updated_at, :doc_file_name
  end

  def self.down
    remove_column :documents, :doc_file_name, :file_file_name
    remove_column :documents, :doc_file_name, :file_content_type
    remove_column :documents, :doc_file_name, :file_file_size
    remove_column :documents, :doc_file_name, :file_updated_at
  end
end
