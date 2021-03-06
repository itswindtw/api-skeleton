namespace :db do
  task :environment do
    MIGRATIONS_DIR = ENV['MIGRATIONS_DIR'] || 'db/migrations'
  end

  task drop: :environment do
    Sequel::Migrator.run(DB, MIGRATIONS_DIR, target: 0)
  end

  task migrate: :environment do
    if Sequel::Migrator.is_current?(DB, MIGRATIONS_DIR)
      puts 'No need to do migration.'
    else
      Sequel::Migrator.run(DB, MIGRATIONS_DIR)
      Rake::Task['db:schema:dump'].invoke
    end
  end

  namespace :schema do
    task dump: :environment do
      DB.extension :schema_dumper

      File.open('db/schema.rb', 'w') do |f|
        f << DB.dump_schema_migration
      end
    end
  end
end
