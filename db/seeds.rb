User.create(email: 'tuan@gmail.com', password: 'votuan', password_confirmation: 'votuan')

30.times do
  Course.create!([{
                    title: Faker::Educator.course_name,
                    description: Faker::TvShows::GameOfThrones.quote,
                    user_id: User.first.id
                  }])
end