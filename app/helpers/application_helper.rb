module ApplicationHelper
  def bootstrap_alert_class(flash_name)
    flash_overrides = { error: 'danger', notice: 'success', alert: 'info' }
    flash_overrides.fetch(flash_name.to_sym, flash_name.to_s)
  end
end
