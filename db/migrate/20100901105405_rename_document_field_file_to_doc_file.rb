class RenameDocumentFieldFileToDocFile < ActiveRecord::Migration
  def self.up
    rename_column :documents, :file_file_name, :doc_file_name
    rename_column :documents, :file_content_type, :doc_content_type
    rename_column :documents, :file_file_size, :doc_file_size
    rename_column :documents, :file_updated_at, :doc_updated_at
  end

  def self.down
    rename_column :documents, :doc_file_name, :file_file_name
    rename_column :documents, :doc_content_type, :file_content_type
    rename_column :documents, :doc_file_size, :file_file_size
    rename_column :documents, :doc_updated_at, :file_updated_at
  end
end
