# frozen_string_literal: true

module ApplicationHelper
  def active?(path)
    'active' if current_page?(path)
  end

  def admin?
    current_user.user_type == 'admin'
  end

  def completed?(isee_card)
    'success' if isee_card.completed == true
  end

  def completed_icon?(isee_card)
    if (isee_card.completed == true) && (isee_card.completion_date != nil)
      icon('fas', 'check', class: 'text-success')
    else
      icon('fas', 'times', class: 'text-primary')
    end
  end

  def completed_date?(isee_card)
    if (isee_card.completed == true) && (isee_card.completion_date != nil)
      l(@isee_card.completion_date, format: '%A %d %B %Y')
    end
  end

  def modified?(isee_card)
    isee_card.updater !=nil
  end

  def message_priority?(dashboard)
    if dashboard.message_priority.name == 'Normale'
      'primary'
    elsif dashboard.message_priority.name == 'Info'
      'info'
    elsif dashboard.message_priority.name == 'Attenzione'
      'danger'
    end
  end
end
