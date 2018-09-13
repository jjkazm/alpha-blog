desc 'Counter cache for user has many articles'

task article_counter: :environment do
  User.reset_column_information
  User.find_each do |p|
    User.reset_counters p.id, :articles
  end
end
