require 'faker'
10.times do |index|
  teacher_id = (Teacher.all.to_a.sample).id
  Course.create(name: Faker::Educator.course_name, description: Faker::Quote.jack_handey,teacher_id:teacher_id)
end
