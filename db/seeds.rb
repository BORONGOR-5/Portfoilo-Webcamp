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
    email: ENV['ADMIN_EMAIL'],
    password: ENV['ADMIN_PASSWORD']
    )

  Genre.create!(
    id: 1,
    name: "恋愛/ラブコメ",
    is_active: true
    )
  Genre.create!(
    id: 2,
    name: "アクション/バトル",
    is_active: true
    )
  Genre.create!(
    id: 3,
    name: "ミステリー/ホラー/サスペンス",
    is_active: true
    )
  Genre.create!(
    id: 4,
    name: "SF/ファンタジー",
    is_active: true
    )
  Genre.create!(
    id: 5,
    name: "ギャグ/コメディ",
    is_active: true
    )
  Genre.create!(
    id: 6,
    name: "戦争/歴史",
    is_active: true
    )
  Genre.create!(
    id: 7,
    name: "青春/ドラマ",
    is_active: true
    )
  Genre.create!(
    id: 8,
    name: "スポーツ/競技",
    is_active: true
    )
  Genre.create!(
    id: 9,
    name: "キッズ/ ファミリー",
    is_active: true
    )
  Genre.create!(
    id: 10,
    name: "伝記/ドキュメンタリー",
    is_active: true
    )