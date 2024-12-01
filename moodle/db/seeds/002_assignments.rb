require 'faker'
20.times do
  course_id = (Course.all.to_a.sample).id
  deadline = Faker::Time.between(from: DateTime.now + 10, to: DateTime.now + 100, format: :long)
  Assignment.create(deadline:deadline,title: Faker::Commerce.product_name,content: Faker::Quote.matz,course_id: course_id)
end