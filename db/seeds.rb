# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
Task.create!([{
  title: "Scrub all the toilets",
  priority: "high",
  completed: false,
  due_date: "2022-02-02",
  description: "Scrub all the toilets in the house",
}])
Task.create!([{
  title: "Dust the house",
  priority: "medium",
  completed: false,
  due_date: "2022-02-02",
  description: "Grab a duster and tackle the entire house",
}])
Task.create!([{
  title: "Vacumn the house",
  priority: "low",
  completed: false,
  due_date: "2022-02-02",
  description: "grab the cordless vacumn and take it all over the house, don't forget the stairs",
}])
Task.create!([{
  title: "Order groceries",
  priority: "high",
  completed: false,
  due_date: "2022-02-02",
  description: "We need to eat please order something",
}])
Task.create!([{
  title: "Wash the dishes",
  priority: "low",
  completed: true,
  due_date: "2022-02-02",
  description: "grab a sponge and clean everything in the sink",
}])
Task.create!([{
  title: "Mop the floors",
  priority: "medium",
  completed: false,
  due_date: "2022-02-02",
  description: "Use the steam mop, make sure to sweep the floor first",
}])
Task.create!([{
  title: "Sweep the floor",
  priority: "low",
  completed: false,
  due_date: "2022-02-02",
  description: "There are crumbs literally everywhere",
}])
Task.create!([{
  title: "Do a load of laundry",
  priority: "medium",
  completed: false,
  due_date: "2022-02-02",
  description: "Your clothes smell, please wash them",
}])
Group.create(name: "Indoor")
Group.create(name: "Outdoor")
Group.create(name: "Menial")
Group.create(name: "Extensive")
Group.create(name: "Taxing")
Group.create(name: "Wishlist")
Group.create(name: "Weekly Chores")
