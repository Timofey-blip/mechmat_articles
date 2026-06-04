# Очищаем старые данные
Comment.destroy_all
Article.destroy_all
Category.destroy_all

# Создаем категории
math = Category.create!(name: "Математика")
ruby = Category.create!(name: "Ruby on Rails")
physics = Category.create!(name: "Физика")

# Создаем статьи
Article.create!(
  title: "Введение в Ruby on Rails",
  content: "Rails - это фреймворк на языке Ruby, который использует паттерн MVC. Он позволяет быстро создавать веб-приложения.",
  author: "Студент 3 курса",
  views_count: 15,
  is_published: true,
  category: ruby
)

Article.create!(
  title: "Ряды Тейлора простыми словами",
  content: "Ряд Тейлора позволяет представить функцию в виде суммы бесконечного ряда. Это мощный инструмент математического анализа.",
  author: "Мехматовец",
  views_count: 42,
  is_published: true,
  category: math
)

Article.create!(
  title: "Законы Ньютона",
  content: "Три закона Ньютона описывают движение тел и являются основой классической механики.",
  author: "Физик",
  views_count: 28,
  is_published: true,
  category: physics
)

puts "База данных успешно наполнена! Создано #{Category.count} категорий и #{Article.count} статей."