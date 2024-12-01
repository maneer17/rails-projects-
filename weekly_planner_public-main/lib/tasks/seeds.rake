namespace :seeds do
  desc "seed tasks"
  task tasks: :environment do
    category_ids = Category.ids

    200.times do |index|
      Task.create!(title: Faker::Name.name, category_id: category_ids.sample)
    end
  end
end
