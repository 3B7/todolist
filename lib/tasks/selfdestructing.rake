task delete_todos: :environment do
  Todo.where("created_at <= ?", Time.now - 2.hours).destroy_all
end