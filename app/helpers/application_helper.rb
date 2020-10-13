# frozen_string_literal: true

module ApplicationHelper
  def active?(path)
    'active' if current_page?(path)
  end

  def admin?
    current_user.user_type == 'admin'
  end

  def completed?(isee_card)
    'tr-success' if isee_card.completed == true
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


  def finalized?(icric_pai)
    'tr-success' if icric_pai.completed == true
  end

  def finalized_icon?(icric_pai)
    if (icric_pai.completed == true) && (icric_pai.completion_date != nil)
      icon('fas', 'check', class: 'text-success')
    else
      icon('fas', 'times', class: 'text-primary')
    end
  end

  def finalized_date?(icric_pai)
    if (icric_pai.completed == true) && (icric_pai.completion_date != nil)
      l(@icric_pai.completion_date, format: '%A %d %B %Y')
    end
  end

  def modified?(isee_card)
    isee_card.updater !=nil
  end

  def changed?(icric_pai)
    icric_pai.updater !=nil
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
