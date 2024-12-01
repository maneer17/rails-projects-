namespace :maintenance do
  desc "encrypt_task_title"
  task encrypt_task_title: :environment do
    Task.all.each do |t|
      binding.irb
      t.update_columns(title: t.attributes_before_type_cast["title"])
    end
  end
end
