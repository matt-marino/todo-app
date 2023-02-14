# typed: false
# frozen_string_literal: true

module TasksHelper
  def complete_or_incomplete_checkbox(task)
    if task.completed?
      check_box("Completed", task_path(task), method: :delete)
    else
      check_box("Completed", tasks_path(task))
    end
  end

  def nav_link_to(text, url)
    if current_page?(url)
      link_to(text, url, class: "active")
    else
      link_to(text, url)
    end
  end
end
