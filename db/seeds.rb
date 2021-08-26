# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  5.times do |n|
    User.create!(
      email: "test#{n + 1}@test.com",
      last_name: "テスト",
      first_name: "太朗#{n + 1}",
      last_name_kana: "テスト",
      first_name_kana: "タロウ",
      company: "シッカリ",
      department: "営業部",
      position: "課長",
      password: 'password'
    )
  end

  User.all.each do |user|
  user.todos.create!(
    title: 'タイトル',
    body: 'テキストテキストテキストテキスト',
    deadline: '2021-07-08 11:11:11',
    duration: 30,
    completed: 'true',
    priority: 0
  )
  end

  User.all.each do |user|
  user.events.create!(
    title: 'タイトル',
    overview: 'テキストテキストテキストテキスト',
    start_time: '2021-07-08 11:11:11',
    finish_time: '2021-07-08 11:11:12',
  )
  end
