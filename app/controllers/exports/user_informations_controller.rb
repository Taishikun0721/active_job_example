class Exports::UserInformationsController < ApplicationController
  include ExportControllerConcern

  def index
    send_export_data
  end

  private

  def export_data
    @export.to_users_csv
  end
end



