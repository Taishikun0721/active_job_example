module ExportControllerConcern
  extend ActiveSupport::Concern

  included do
    before_action :load_export
    before_action :export_data
  end

  private

  def load_export
    @export = Export.new
  end

  def send_export_data
    respond_to do |format|
      format.csv { send_data export_data, filename: export_filename }
    end
  end

  def export_data
    raise 'overraide in controller'
  end

  def export_filename
    "#{controller_name}.csv"
  end
end