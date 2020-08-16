# Find and load all seed files
Dir[File.join(Rails.root, 'db', 'seeds/**', '*.rb')].sort.each do |seed|
  load seed
end