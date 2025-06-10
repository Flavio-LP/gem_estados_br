require 'bundler/setup'
require 'active_record'
require 'estados_br_ar'

# Configure the database connection
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: '../estados_br_ar/database/db.sqlite3') # Use in-memory database for tests


# Define the schema
ActiveRecord::Schema.define do
  # Ensure the table is created only if it doesn't exist to avoid errors on multiple runs
  unless ActiveRecord::Base.connection.table_exists?(:estados)
    create_table :estados do |t|
      t.string :nome
      t.string :sigla
      t.timestamps
    end
  end
end

RSpec.configure do |config|
  # Some RSpec configurations (optional, but good practice)
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  # Clean up the database before each test run
  config.before(:suite) do
    # Ensure schema is loaded
    # The schema definition above will run when this file is required.
    # If you had a separate migration system, you'd run migrations here.
  end

  config.around(:each) do |example|
    ActiveRecord::Base.transaction do
      example.run
      raise ActiveRecord::Rollback # Rolls back the transaction after each example
    end
  end
end