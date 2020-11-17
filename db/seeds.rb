# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  Member.create!(
  name: 'グリコ太郎',
  email: 'aaa@aaa',
  password: 'aaaaaa',
  is_deleted: false
  )

  Member.create!(
  name: 'ソニー佐々木',
  email: 'bbb@bbb',
  password: 'bbbbbb',
  is_deleted: false
  )

  Admin.create!(
    email: 'admin@admin.com',
    password: 'adminadmin'
    )

  Genre.create!(
    id: 1,
    name: "恋愛/青春",
    is_active: true
    )
  Genre.create!(
    id: 2,
    name: "アクション/バトル",
    is_active: true
    )
  Genre.create!(
    id: 3,
    name: "ミステリー/サスペンス",
    is_active: true
    )
  Genre.create!(
    id: 4,
    name: "SF/ファンタジー",
    is_active: true
    )

  Movie.create!(
  genre_id: 2,
  image_id: '',
  title: 'マトリックス',
  introduction: 'マトリックス1作品目です。',
  )

  Movie.create!(
  genre_id: 3,
  image_id: '',
  title: 'シャーロックホームズ',
  introduction: 'シャーロクホームズです。',
  )

  Movie.create!(
  genre_id: 1,
  image_id: '',
  title: '天気の子',
  introduction: '「君の名は」で一躍有名になった新海監督の最新作です。',
  )

  Movie.create!(
  genre_id: '1',
  image_id: '',
  title: '鋼の錬金術師',
  introduction: '鋼の錬金術師です。',
  )
  
  Review.create!(
    member_id: "2",
    movie_id: "3",
    title: "最高",
    impression: "実に最高だった"
    )
    
    Review.create!(
    member_id: "2",
    movie_id: "1",
    title: "まあまあ",
    impression: "普通"
    )
    
    Review.create!(
    member_id: "1",
    movie_id: "3",
    title: "うーん",
    impression: "微妙だった"
    )