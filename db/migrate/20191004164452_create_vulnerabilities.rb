class CreateVulnerabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :vulnerabilities do |t|
      t.references :version, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
